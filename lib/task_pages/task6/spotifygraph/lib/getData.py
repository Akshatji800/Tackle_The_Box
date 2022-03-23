import requests
import json

token = 'BQCpTBBpjpa1GXXyQP-vCoKmHzuwSP-u0wBBN5KWS76J36FxOjvg5KJe9-LrDh99W8cyvQdxIEngiY3KUO2q47JjXenA08Qy3QuDqiHTpwO60T8p0O5gqjOgXNJBE7UTBqoQJ7j8xcbtpw1Hp1TwIS2yv2mXC8hGxbOzdA7Fnoq79ZXD08QFVFFfrQ'
header = {'Authorization': f"Bearer {token}",}
link1 = 'https://api.spotify.com/v1/users/hgh277frm7nt233s6jr20fmw5/playlists'
link2 = 'https://api.spotify.com/v1/playlists/6UfFl1PErvn3F2JCG1Hsvr'

response1 = requests.get(link1 ,headers=header)
j1=json.loads(response1.text)
with open('assets/data/spotifyLinks.json', 'wb') as myFile:
    myFile.write(response1.text.encode('utf-8'))

response2 = requests.get(link2, headers=header)
with open('assets/data/spotifyPlaylistInfo.json', 'wb') as myFile:
    myFile.write(response2.text.encode('utf-8'))

dict={}
dict['items'] = []
trackCountList = []
followerCountList = []

items = j1['items']
for i in range(len(items)):
    playlistInfo = {}
    playlistInfo['playlistName'] = items[i]['name']
    playlistInfo['imageURL'] = items[i]['images'][0]['url']
    playlistInfo['trackCount'] = items[i]['tracks']['total']

    link=items[i]['href']
    response3 = requests.get(link, headers=header)
    j2 = json.loads(response3.text)
    playlistInfo['followerCount'] = j2['followers']['total']

    trackCountList.append(playlistInfo['trackCount'])
    followerCountList.append(playlistInfo['followerCount'])
    dict['items'].append(playlistInfo)


dict['maxTracks'] = max(trackCountList)
dict['maxFollowers'] = max(followerCountList)

print(dict)
with open('assets/data/spotifyPlaylistData.json', 'w', encoding='utf-8') as myFile:
    json.dump(dict, myFile, indent = 4, ensure_ascii=False)
