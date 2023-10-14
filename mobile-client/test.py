from google.cloud import storage
from google.cloud.exceptions import NotFound
import os

def upload_video_to_firebase(video_path, bucket_name, destination_blob_name):
    # Set up Google Cloud Storage client
    client = storage.Client()

    # Get or create a bucket
    bucket = client.bucket(bucket_name)

    # Check if the video file exists
    if not os.path.exists(video_path):
        print(f"Error: Video file '{video_path}' not found.")
        return

    # Upload the video file to Firebase Storage
    blob = bucket.blob(destination_blob_name)
    blob.upload_from_filename(video_path)

    print(f"Video uploaded to Firebase Storage: gs://{bucket_name}/{destination_blob_name}")