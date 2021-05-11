#!/bin/sh
read -p "Please enter username: " user
#BACKUP (folder)
echo ------------------------------
echo BELOW IS BACKUP FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_01/log/log_file_backup-$(date +%Y-%m-%d) /home/$user/homeserver/backup/ "/media/$user/seagate_4tb_01/server_backup/backup"
echo ABOVE IS BACKUP FOLDER
echo ------------------------------
#DOCUMENTS
echo ------------------------------
echo BELOW IS DOCUMENTS FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_01/log/log_file_documents-$(date +%Y-%m-%d) /home/$user/homeserver/documents/ "/media/$user/seagate_4tb_01/server_backup/documents"
echo ABOVE IS DOCUMENTS FOLDER
echo ------------------------------
#MUSIC
echo ------------------------------
echo BELOW IS MUSIC FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_01/log/log_file_music-$(date +%Y-%m-%d) /home/$user/homeserver/music/ "/media/$user/seagate_4tb_01/server_backup/music"
echo ABOVE IS MUSIC FOLDER
echo ------------------------------
#PHOTOS
echo ------------------------------
echo BELOW IS PHOTOS FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_01/log/log_file_photos-$(date +%Y-%m-%d) /home/$user/homeserver/photos/ "/media/$user/seagate_4tb_01/server_backup/photos"
echo ABOVE IS PHOTOS FOLDER
echo ------------------------------
#PUBLIC
echo ------------------------------
echo BELOW IS PUBLIC FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_01/log/log_file_public-$(date +%Y-%m-%d) /home/$user/homeserver/public/ "/media/$user/seagate_4tb_01/server_backup/public"
echo ABOVE IS PUBLIC FOLDER
echo ------------------------------
#SOFTWARE
echo ------------------------------
echo BELOW IS SOFTWARE FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_01/log/log_file_software-$(date +%Y-%m-%d) /home/$user/homeserver/software/ "/media/$user/seagate_4tb_01/server_backup/software"
echo ABOVE IS SOFTWARE FOLDER
echo ------------------------------
#TORRENT
echo ------------------------------
echo BELOW IS TORRENT FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_01/log/log_file_torrent-$(date +%Y-%m-%d) /home/$user/homeserver/torrent/ "/media/$user/seagate_4tb_01/server_backup/torrent"
echo ABOVE IS TORRENT FOLDER
echo ------------------------------
#MUSIC VIDEOS
echo ------------------------------
echo BELOW IS MUSIC_VIDEOS FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_02/log/log_file_music_videos-$(date +%Y-%m-%d) /home/$user/homeserver/music_videos/ "/media/$user/seagate_4tb_02/server_backup/music_videos"
echo ABOVE IS MUSIC_VIDEOS FOLDER
echo ------------------------------
#MOVIES
echo ------------------------------
echo BELOW IS MOVIES FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_02/log/log_file_movies-$(date +%Y-%m-%d) /home/$user/homeserver/movies/ "/media/$user/seagate_4tb_02/server_backup/movies"
echo ABOVE IS MOVIES FOLDER
echo ------------------------------
#TV_SHOWS
echo ------------------------------
echo BELOW IS TV_SHOWS FOLDER
rsync -avhP --delete --log-file=/media/$user/seagate_4tb_03/log/log_file_tv_shows-$(date +%Y-%m-%d) /home/$user/homeserver/tv_shows/ "/media/$user/seagate_4tb_03/server_backup/tv_shows"
echo ABOVE IS TV_SHOWS FOLDER
echo ------------------------------
