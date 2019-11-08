import cv2
import numpy as np
import urllib.request
import sys




def automatic_comparison(img_crop, morf):
    img_crop = cv2.Canny(img_crop,100,110)
    morf = cv2.Canny(morf,100,110)

    diff = img_crop - morf

    average = np.mean(diff)

    return average

def main():
    req_img_html = urllib.request.urlopen(sys.argv[1])
    req_morf = urllib.request.urlopen(sys.argv[2])

    arr_img_html = np.asarray(bytearray(req_img_html.read()), dtype=np.uint8)
    arr_morf = np.asarray(bytearray(req_morf.read()), dtype=np.uint8)

    img_html = cv2.imdecode(arr_img_html, -1)
    morf = cv2.imdecode(arr_morf, -1)
   
    left = int(sys.argv[5])
    top = int(sys.argv[4])
    right = left+int(sys.argv[3])
    bottom = top+int(sys.argv[3])
    width = int(sys.argv[6])
    height = int(sys.argv[7])
    dim = (width, height)

    img_html_resized = cv2.resize(img_html,dim)
    morf_resized = cv2.resize(morf,(int(sys.argv[3]),int(sys.argv[3])))
   
    cropped = img_html_resized[top:top+int(sys.argv[3]), left:left+int(sys.argv[3])]

    result = automatic_comparison(cropped, morf_resized)

    print(result)

if __name__ == "__main__":
    main()

   
