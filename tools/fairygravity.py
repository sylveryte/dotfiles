#!/usr/bin/env python

import os, sys, re, time, getopt

class Compressor:
    def __init__(self, path, budget=False, on_compress=False, chunk_size=200, threshold_size=900, threshold_size_vid=480):
        self.chunk_size = chunk_size
        self.threshold_size = threshold_size
        self.threshold_size_vid = threshold_size_vid
        self.path = path
        self.budget = budget
        self.on_compress = on_compress
        print(f"Compressor is created {self.__repr__()}")
        if budget and on_compress:
            print("It's a budget Compressor with on_compress ICING!!".center(120,'-'))
        elif budget:
            print("It's a budget Compressor".center(120,'-'))
        else:
            print("It's a normal Compressor".center(120,'-'))

    def compress(self):
        t = time.time()
        images, videos = self._get_files()
        st = (time.time()-t)
        t = time.time()
        print(f"Selection time {st:0.5} secs\n")
        self.compress_images(images)
        it = (time.time()-t)
        print(f"Image time {it/60:0.5} mins\n")
        t = time.time()
        self.compress_videos(videos)
        vt = (time.time()-t)
        print(f"Selection time {st:0.5} secs\n"
                f"Image time {it/60:0.5} mins\n"
                f"Video time {vt/60:0.5} mins\n"
                f"Total time taken is {(st+it+vt)/60:0.5} mins")

    def _get_files(self):
        files=[]
        images = []
        videos = []

        for x in  os.listdir(self.path):
            files.append(re.escape(x))
        self.path = re.escape(self.path)

        r = re.compile(r"\.(jpg|JPG|jpeg|JPEG)$")
        v = re.compile(r"\.(mkv|MKV|webm|mp4|MP4|flv|mov|MOV|mpg|MPG|3gp|3GP|FLV|avi|AVI)$")
        for x in files:
            x = os.path.join(self.path,x)
            if r.search(x):
                images.append(x)
                continue
            if v.search(x):
                videos.append(x)
        return images, videos

    def chunks(self, l, n):
        for i in range(0, len(l), n):
            print(f'Image progress {i}/{len(l)}'.center(120,'_'))
            yield l[i:i + n]

    def _get_min(self, f):
        s=os.popen(f"identify -ping -format '%w %h' {f}").read()
        if not s:
            return None,None
        s=str(s)
        a=list(map(int,s.split()))
        min=None
        portrait=False
        if a[0]<a[1]:
           portrait = True 
           min = a[0]
        else:
            min = a[1]
        return portrait, min


    def _get_min_vid(self, f):
        s=os.popen(f"ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 {f}").read()
        if not s:
            return None
        s=str(s)
        a=list(map(int,s.split()))
        m=min(a)
        portrait=False
        ps = os.popen(f"ffprobe -v error -select_streams v:0 -show_entries stream_tags=rotate -of default=nw=1:nk=1 -i {f}").read()
        if ps:
            psi = int(ps)
            if psi == 90 or psi == 270:
                portrait = True
        return portrait, m

    def _filter_budget_images(self, images):
            budget = []
            budget_portrait = []
            normal = []
            for x in images:
                p, m = self._get_min(x)
                if m and m > self.threshold_size:
                    if p:
                        budget_portrait.append(x)
                    else:
                        budget.append(x)
                else:
                    normal.append(x)
            print(f'Filtered {len(images)} images -> {len(budget_portrait)} budget_portrait {len(budget)} budget : {len(normal)} normals')
            return budget_portrait, budget, normal

    def backup_vid(self, vid):
        original_vids_path = os.path.join(self.path,"original_vids")
        if not os.path.isdir(original_vids_path):
            os.system("mkdir -p "+original_vids_path)
        os.system("mv "+vid+" "+original_vids_path)

    def backup_imgs(self, images):
        original_image_path = os.path.join(self.path,"original_images")
        if not os.path.isdir(original_image_path):
            os.system("mkdir -p "+original_image_path)
        os.system("cp "+" ".join(images)+" "+original_image_path)

    def _compress_video(self, vid):
        vidout = vid + 'out.mp4'
        pname,_,_ = vid.rpartition('.')
        pname+=".mp4"
        portrait, m = self._get_min_vid(vid)
        if self.budget and m > self.threshold_size_vid:
            if portrait:
                print("OH YEEAAH BUDGET Portrait VIDEO".center(120,"*"))
                os.system(f"ffmpeg -i {vid} -vf 'scale={self.threshold_size_vid}:-2' -vcodec libx264 -crf 24 {vidout}")
            else:
                print("OH YEEAAH BUDGET Landscape VIDEO".center(120,"*"))
                os.system(f"ffmpeg -i {vid} -vf 'scale=-2:{self.threshold_size_vid}' -vcodec libx264 -crf 24 {vidout}")
        elif not self.on_compress:
            print("so raww".center(120,"^"))
            os.system(f"ffmpeg -i {vid} -vcodec  libx264 -crf 24 {vidout}")
        else:
            print("COOL THIS ONEs SLIDING".center(120,"="))
            return
        self.backup_vid(vid)
        os.system(f"mv {vidout} {pname}")

    def compress_videos(self, videos):
        total = len(videos)
        for count, video in enumerate(videos, start=1):
            print(f"{count}/{total}".center(120,'_'))
            print(f"{video}".center(120,'+'))
            self._compress_video(video)

    def _compress_images(self, images):
        self.backup_imgs(images)
        if self.budget:
            budget_portrait, budget, normal = self._filter_budget_images(images)
            if budget :
                print("These budget landscape images".center(120,"-"))
                os.system("mogrify -strip -sampling-factor 4:2:0 -quality 75 -interlace JPEG  -resize x"+str(self.threshold_size)+" "+" ".join(budget))
            if budget_portrait:
                print("These budget portrait images".center(120,"-"))
                os.system("mogrify -strip -sampling-factor 4:2:0 -quality 75 -interlace JPEG  -resize "+str(self.threshold_size)+"x "+" ".join(budget_portrait))
            if normal and not self.on_compress: 
                print("so raww".center(120,"^"))
                os.system("mogrify -strip -sampling-factor 4:2:0 -quality 75 -interlace JPEG  "+" ".join(normal))
            else:
                print(f"NIgga these {len(normal)} are sliding fine af".center(120,"*"))
        else:
            os.system("mogrify -strip -sampling-factor 4:2:0 -quality 75 -interlace JPEG  "+" ".join(images))

    def compress_images(self, images):
        for ims in self.chunks(images,self.chunk_size):
            t = time.time()
            self._compress_images(ims)
            print(f'This chunk took {(time.time()-t)/60:0.5} mins')

if __name__ == "__main__":
    args = sys.argv[1:]
    budget = False
    on_compress = False
    path = None
    if len(args)>0:
        for x in args:
            if x == '-b':
                budget = True
            elif x == '-bc' or  x == '-cb':
                budget = True
                on_compress = True
            else:
                path = x

    if path : 
        path = os.path.join(os.getcwd(), path)
        print(f'path is {path}')
        compressor = Compressor(path, budget=budget, on_compress=on_compress)
        compressor.compress()
    else:
        print(f'no path your path {path}')
    print("DOne finally!!")
