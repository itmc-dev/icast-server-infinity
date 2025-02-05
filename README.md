# icast-server-infinity
Audio Stream server Icast for Infinity


docker-compose up -d

docker-compose up --build -d


Stream Audio to Icecast
Use BUTT (Broadcast Using This Tool) or Liquidsoap to send audio to Icecast.

Using BUTT
Download and install BUTT.
Configure:
Server: http://yourdomain.com:4500
Mountpoint: /stream
Password: sourcepassword
Codec: MP3 or Ogg Vorbis
Start streaming.

<audio controls>
    <source src="http://yourdomain.com:8000/stream" type="audio/mpeg">
    Your browser does not support the audio element.
</audio>


docker-compose down
docker-compose up --build

docker logs icecast

docker-compose down
docker-compose up -d --build


✅ Icecast Admin & Streaming Guide with BUTT 🎶
Now that your Icecast server is running successfully in Docker, let's go over how to access the admin panel and stream using BUTT (Broadcast Using This Tool).

🛠️ 1. How to Access the Icecast Admin Panel
The admin page allows you to monitor streams, listeners, and server status.

📌 Steps to Access the Admin Panel
1️⃣ Open your web browser

2️⃣ Go to:

If running locally:
👉 http://localhost:4500/admin/
If running on a remote VPS/server (replace your-server-ip with actual IP):
👉 http://your-server-ip:4500/admin/ 3️⃣ Enter admin login credentials:
Username: admin
Password: adminpassword
4️⃣ You should now see the Icecast Web Admin Dashboard ✅ 🎉

✅ Icecast Admin & Streaming Guide with BUTT 🎶
Now that your Icecast server is running successfully in Docker, let's go over how to access the admin panel and stream using BUTT (Broadcast Using This Tool).

🛠️ 1. How to Access the Icecast Admin Panel
The admin page allows you to monitor streams, listeners, and server status.

📌 Steps to Access the Admin Panel
1️⃣ Open your web browser

2️⃣ Go to:

If running locally:
👉 http://localhost:4500/admin/
If running on a remote VPS/server (replace your-server-ip with actual IP):
👉 http://your-server-ip:4500/admin/ 3️⃣ Enter admin login credentials:
Username: admin
Password: adminpassword
4️⃣ You should now see the Icecast Web Admin Dashboard ✅ 🎉
📡 2. How to Stream Audio to Icecast using BUTT
BUTT (Broadcast Using This Tool) is a free and simple tool to stream live audio to Icecast.

📥 Install BUTT
🔹 Download BUTT here

🔹 Available for Windows, macOS, and Linux

🎛️ Configure BUTT for Icecast (Step-by-Step)
1️⃣ Open BUTT and go to Settings (⚙️ icon)

2️⃣ Add a New Server:

Click "Add" under "Main" -> "Server Settings"
3️⃣ Enter Your Icecast Server Details:

Server Type: Icecast
Address: localhost (if running locally) OR your-server-ip
Port: 4500
Mount Point: /stream
User: source
Password: sourcepassword
4️⃣ Save Settings & Connect

Click "Save"
Click "Connect"
If connected successfully, you will see LIVE STREAMING in green ✔️

🗺️ Test Your Stream
Once connected, you can listen to your stream by opening:
👉 http://localhost:4500/stream (for local)

👉 http://your-server-ip:4500/stream (for remote)

docker-compose down
docker-compose up -d

