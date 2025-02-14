import os
import sys
import requests

#GITHUB_REPO =  "AlticeGroupIT/acct-sf-metadata"
GITHUB_REPO =  "Leandro-c-barbosa-alt/githubactions" 
RETENTION_DAYS = 7 

## Function to upload one file to github actions
def uploadArtifact(runid, token, file_path):

    file_name = os.path.basename(file_path)

    # Github API Endpoint 
    BASE_URL = f"https://api.github.com/repos/{GITHUB_REPO}/actions/runs/{runid}/artifacts"

    # Headers 
    HEADERS = {
        "Authorization": f"token {token}",
        "Accept": "application/vnd.github+json"
    }

    print(file_path)
    print(os.getcwd())
    print(BASE_URL)

    # Open file to upload
    with open(file_path, "rb") as file_data:
        response = requests.post(
            BASE_URL,
            headers=HEADERS,
            files={"file": (file_name, file_data, "application/zip")},
            data={"name": file_name, "retention_days": str(RETENTION_DAYS)}
        )

    if response.status_code == 201:
        print(f"✅ Upload success: {file_name}")
    else:
        print(f"❌ Error on upload {file_name}: {response.status_code} - {response.text}")

## Function to load all artifacts  
def loadArtifacts(runid, token, artifactList):
    # check if the files on list exist and do the upload to github actions
    for artifact in artifactList.split():
        if os.path.exists(artifact):
            uploadArtifact(runid, token, artifact)
        else:
            print(f"⚠️ File not found: {artifact}")

    print("🎉 Upload done!")

# main function
if __name__ == "__main__":
    print (len(sys.argv))
    if len(sys.argv) != 4:
        print("Usage: python helper.py RUN_ID TOKEN 'file1 file2'")
    else:
        loadArtifacts(sys.argv[1], sys.argv[2], sys.argv[3])



