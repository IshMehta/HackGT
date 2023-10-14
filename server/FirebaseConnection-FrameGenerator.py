# import firebase_admin
# from firebase_admin import credentials
import pyrebase
import cv2
import time
import os



def getFrames(videoName, REQUIRED_FRAMES = 500):

    '''
    instead of taking frames randomly, it would be great to take frames from sections of the video where there is more movement
    '''

    cam = cv2.VideoCapture(videoName) 
    REQUIRED_FRAMES = 370
    total_frames = cam.get(cv2.CAP_PROP_FRAME_COUNT) 
    if REQUIRED_FRAMES > total_frames:
        print("Video is not long enough for the number of frames required")
    else:
        frames_to_get = total_frames // REQUIRED_FRAMES
        currentframe = 0
        os.mkdir('./data/'+ videoName)
        while(True): 
            
            # reading from frame 
            ret,frame = cam.read() 
        
            if ret: 
                if currentframe%frames_to_get == 0:
                    # if video is still left continue creating images 
                    name = './data/'+ videoName +'/frame' + str(currentframe) + '.jpg'
                    print ('Creating...' + name) 
            
                    # writing the extracted images 
                    cv2.imwrite(name, frame) 
            
                # increasing counter so that it will 
                # show how many frames are created 
                currentframe += 1
            else: 
                break
    
        # Release all space and windows once done 
        cam.release() 
        cv2.destroyAllWindows() 

config = {
  "apiKey": "AIzaSyDjmO_MimhEpGZibo4Wfx5txCLay_PNB18",
  "authDomain": "hackgt-5b60a.firebaseapp.com",
 "projectId": "hackgt-5b60a",
  "storageBucket": "hackgt-5b60a.appspot.com",
  "messagingSenderId": "458809642203", 
  "serviceAccount": "serviceAccount.json",
  "databaseURL" : "https://hackgt-5b60a-default-rtdb.firebaseio.com/"
}

firebase_storage = pyrebase.initialize_app(config)


storage = firebase_storage.storage()
# storage.child("imag/mask_1.png").put("mask_1.png")
# storage.child("videos/test.mp4").put("test.mp4")


found = False
current_video = 0

video_found = None
while True:
    try:
        video_name = "test" + str(current_video) + ".mp4"
        storage.child("videos/" + video_name).download("test2.mp4")
        getFrames(videoName= video_name)
        current_video +=1
        print("found")
    except: 
        print("waiting")
        time.sleep(5)
        

