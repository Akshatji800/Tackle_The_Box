import spotipy
import json
from spotipy.oauth2 import SpotifyOAuth
import cread
sp = spotipy.Spotify(auth_manager=SpotifyOAuth(client_id=cread.client_ID,
                                               client_secret=cread.client_SECRET,
                                               redirect_uri=cread.redirect_url,
                                               scope="user-library-read"))
f=open("file.json","w")
results = sp.current_user_saved_tracks()

l={"item":[]}
results = sp.current_user_saved_albums()
for idx, item in enumerate(results['items']):
    track = item['album']
    my_dict = {}
    my_dict["Artist"]=track['artists'][0]['name']
    my_dict["Name"]=track['name']
    my_dict["Like"]=track['popularity']
    my_dict["image"]=track["images"][0]["url"]
    my_dict["url"]=track['external_urls']["spotify"]
    my_dict["Tracks"]=track['total_tracks']
    l["item"].append(my_dict)
    print(idx, track['artists'][0]['name'], " – ", track['name'], "--", track['popularity'],"--",track["images"][0]["url"], "--", track['total_tracks'])
json.dump(l,f)