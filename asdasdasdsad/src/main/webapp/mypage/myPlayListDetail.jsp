<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*:focus {
	outline: none;
}

body {
	font-family: Helvetica, Arial;
	margin: 0;
}

#app-cover {
	width: 430px;
	height: 100px;
	margin: -4px auto;
}

#player {
	position: relative;
	height: 100%;
	z-index: 3;
}

#player-track {
	background-color: #bbb;
	transition: 0.3s ease top;
	z-index: 1;
}

#player-track.active {
	top: -92px;
}

#album-name {
	color: #fff;
	font-size: 17px;
	font-weight: bold;
}

#track-name {
	color: #000;
	font-size: 15px;
	margin: 2px 0 13px 0;
}

#track-time {
	height: 12px;
	margin-bottom: 3px;
	overflow: hidden;
}

#current-time {
	float: left;
}

#track-length {
	float: right;
}

#current-time, #track-length {
	color: black;
	font-size: 11px;
	border-radius: 10px;
	transition: 0.3s ease all;
}

#track-time.active #current-time, #track-time.active #track-length {
	color: #f86d92;
	background-color: transparent;
}

#s-area, #seek-bar {
	position: relative;
	height: 4px;
	border-radius: 4px;
}

#s-area {
	background-color: #ffe8ee;
	cursor: pointer;
}

#ins-time {
	position: absolute;
	top: -29px;
	color: #fff;
	font-size: 12px;
	white-space: pre;
	padding: 5px 6px;
	border-radius: 4px;
	display: none;
}

#s-hover {
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	opacity: 0.2;
	z-index: 2;
}

#ins-time, #s-hover {
	background-color: #3b3d50;
}

#seek-bar {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	width: 0;
	background-color: #fd6d94;
	transition: 0.2s ease width;
	z-index: 1;
}

#player-content {
	text-align: center;
	position: relative;
	height: 100%;
	border-radius: 15px;
	z-index: 2;
	position: relative;
}

#album-art {
	width: 100%;
	height: 430px;
	transform: rotateZ(0);
	transition: 0.3s ease all;
	overflow: hidden;
}

#album-art.active {
	top: -60px;
	box-shadow: 0 0 0 4px #fff7f7, 0 30px 50px -15px #afb7c1;
}

#album-art:before {
	content: '';
	position: absolute;
	top: 50%;
	right: 0;
	left: 0;
	width: 20px;
	height: 20px;
	margin: -10px auto 0 auto;
	background-color: #d6dee7;
	border-radius: 50%;
	box-shadow: inset 0 0 0 2px #fff;
	z-index: 2;
}

#album-art img {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	opacity: 0;
	z-index: -1;
}

#album-art img.active {
	opacity: 1;
	z-index: 1;
}

#album-art.active img.active {
	z-index: 1;
	animation: rotateAlbumArt 3s linear 0s infinite forwards;
}


#buffer-box {
	position: absolute;
	top: 50%;
	right: 0;
	left: 0;
	height: 13px;
	color: #1f1f1f;
	font-size: 13px;
	font-family: Helvetica;
	text-align: center;
	font-weight: bold;
	line-height: 1;
	padding: 6px;
	margin: -12px auto 0 auto;
	background-color: rgba(255, 255, 255, 0.19);
	opacity: 0;
	z-index: 2;
}

#album-art img, #buffer-box {
	transition: 0.1s linear all;
}

#album-art.buffering img {
	opacity: 0.25;
}

#album-art.buffering img.active {
	opacity: 0.8;
	filter: blur(2px);
	-webkit-filter: blur(2px);
}

#album-art.buffering #buffer-box {
	opacity: 1;
}

#player-controls {
	height: 100%;
	overflow: hidden;
}

.control {
	width: 33.333%;
	float: left;
}

.button {
	cursor: pointer;
	padding: 1em;
	width: auto;
	height: auto;
}

.button i {
	display: block;
	color: #d6dee7;
	font-size: 1em;
	text-align: center;
	line-height: 1;
}

.button, .button i {
	transition: 0.2s ease all;
}

.button:hover {
	background-color: #d6d6de;
}

.button:hover i {
	color: #fff;
}

#ytd-url {
	display: block;
	position: fixed;
	right: 0;
	bottom: 0;
	padding: 10px 14px;
	margin: 20px;
	color: #fff;
	font-size: 14px;
	text-decoration: none;
	background-color: #ae5f87;
	border-radius: 4px;
	box-shadow: 0 10px 20px -5px rgba(174, 95, 135, 0.86);
	z-index: 125;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		playListList(1)
		var playerTrack = $("#player-track"), bgArtwork = $('#bg-artwork'), bgArtworkUrl, albumName = $('#album-name'), trackName = $('#track-name'), sArea = $('#s-area'), seekBar = $('#seek-bar'), trackTime = $('#track-time'), insTime = $('#ins-time'), sHover = $('#s-hover'), playPauseButton = $("#play-pause-button"), i = playPauseButton
				.find('i'), tProgress = $('#current-time'), tTime = $('#track-length'), seekT, seekLoc, seekBarPos, cM, ctMinutes, ctSeconds, curMinutes, curSeconds, durMinutes, durSeconds, playProgress, bTime, nTime = 0, buffInterval = null, tFlag = false , playPreviousTrackButton = $('#play-previous'), playNextTrackButton = $('#play-next'), currIndex = 0;

		function playPause() {
			setTimeout(function() {
				if (audio.paused) {
					playerTrack.addClass('active');
					checkBuffering();
					i.attr('class', 'fas fa-pause');
					audio.play();
				} else {
					playerTrack.removeClass('active');
					clearInterval(buffInterval);
					i.attr('class', 'fas fa-play');
					audio.pause();
				}
			}, 300);
		}

		function showHover(event) {
			seekBarPos = sArea.offset();
			seekT = event.clientX - seekBarPos.left;
			seekLoc = audio.duration * (seekT / sArea.outerWidth());

			sHover.width(seekT);

			cM = seekLoc / 60;

			ctMinutes = Math.floor(cM);
			ctSeconds = Math.floor(seekLoc - ctMinutes * 60);

			if ((ctMinutes < 0) || (ctSeconds < 0))
				return;

			if ((ctMinutes < 0) || (ctSeconds < 0))
				return;

			if (ctMinutes < 10)
				ctMinutes = '0' + ctMinutes;
			if (ctSeconds < 10)
				ctSeconds = '0' + ctSeconds;

			if (isNaN(ctMinutes) || isNaN(ctSeconds))
				insTime.text('--:--');
			else
				insTime.text(ctMinutes + ':' + ctSeconds);

			insTime.css({
				'left' : seekT,
				'margin-left' : '-21px'
			}).fadeIn(0);

		}

		function hideHover() {
			sHover.width(0);
			insTime.text('00:00').css({
				'left' : '0px',
				'margin-left' : '0px'
			}).fadeOut(0);
		}

		function playFromClickedPos() {
			audio.currentTime = seekLoc;
			seekBar.width(seekT);
			hideHover();
		}
		function updateCurrTime() {
			nTime = new Date();
			nTime = nTime.getTime();
			if (!tFlag) {
				tFlag = true;
				trackTime.addClass('active');
			}
			curMinutes = Math.floor(audio.currentTime / 60);
			curSeconds = Math.floor(audio.currentTime - curMinutes * 60);
			durMinutes = Math.floor(audio.duration / 60);
			durSeconds = Math.floor(audio.duration - durMinutes * 60);
			playProgress = (audio.currentTime / audio.duration) * 100;
			if (curMinutes < 10)
				curMinutes = '0' + curMinutes;
			if (curSeconds < 10)
				curSeconds = '0' + curSeconds;

			if (durMinutes < 10)
				durMinutes = '0' + durMinutes;
			if (durSeconds < 10)
				durSeconds = '0' + durSeconds;

			if (isNaN(curMinutes) || isNaN(curSeconds))
				tProgress.text('00:00');
			else
				tProgress.text(curMinutes + ':' + curSeconds);

			if (isNaN(durMinutes) || isNaN(durSeconds))
				tTime.text('00:00');
			else
				tTime.text(durMinutes + ':' + durSeconds);

			if (isNaN(curMinutes) || isNaN(curSeconds) || isNaN(durMinutes)
					|| isNaN(durSeconds))
				trackTime.removeClass('active');
			else
				trackTime.addClass('active');

			seekBar.width(playProgress + '%');

			if (playProgress == 100) {
				i.attr('class', 'fa fa-play');
				seekBar.width(0);
				tProgress.text('00:00');

				clearInterval(buffInterval);
			}
		}

		function checkBuffering() {
			clearInterval(buffInterval);
			buffInterval = setInterval(function() {

				bTime = new Date();
				bTime = bTime.getTime();

			}, 100);
		}
		function selectTrack(flag) {
			if (flag == 0 || flag == 1){
				++currIndex;
				console.log(currIndex)
			}
			else
				--currIndex;
			if ((currIndex > 0) && (currIndex <= $('#list'+currIndex).attr('data-size'))) {
				if (flag == 0)
					i.attr('class', 'fa fa-play');
				else {
					i.attr('class', 'fa fa-pause');
				}

				seekBar.width(0);
				trackTime.removeClass('active');
				tProgress.text('00:00');
				tTime.text('00:00');
				console.log(currIndex)
				currAlbum = $('#list'+currIndex).attr('data-altitle');
				currTrackName = $('#list'+currIndex).attr('data-title');
				$('#album-art').attr("src", $('#list'+currIndex).attr('data-poster'))
				audio.src = $('#list'+currIndex).attr('data-url');
				console.log($('#list'+currIndex).attr('data-url'))
				nTime = 0;
				bTime = new Date();
				bTime = bTime.getTime();

				if (flag != 0) {
					audio.play();
					playerTrack.addClass('active');

					clearInterval(buffInterval);
					checkBuffering();
				}

				albumName.text(currAlbum);
				trackName.text(currTrackName);
			} else {
				if (flag == 0 || flag == 1)
					--currIndex;
				else
					++currIndex;
			}
		}

		function initPlayer() {
			audio = new Audio()
			selectTrack(0)

			audio.loop = false

			playPauseButton.on('click', playPause)

			sArea.mousemove(function(event) {
				showHover(event)
			})

			sArea.mouseout(hideHover)

			sArea.on('click', playFromClickedPos)

			$(audio).on('timeupdate', updateCurrTime)

			playPreviousTrackButton.on('click', function() {
				selectTrack(-1)
			})
			playNextTrackButton.on('click', function() {
				selectTrack(1)
			})
		}
	function playListList(type) {
		let plno = '${plno}'
		$
				.ajax({
					type : 'post',
					url : '../mypage/myPlayListMusicList.do',
					data : {
						'plno' : plno,
						'type' : type
					},
					success : function(result) {
						let playlist = JSON.parse(result)
						
						console.log(playlist)
						console.log(playlist[0].title)
						console.log(playlist.length)
						let html = ''
						let i = 1
						playlist.map(function(music) {
									html += '<tr>'
									html += '<td width="5%" class="text-center">'
											+ i + '</td>'
									html += '<td width="7%" class="text-center"><img src="'
											+ music.poster + '"</td>'
									html += '<td width="78%" style="text-align:left;">'
											+ music.title
											+ '<br>'
											+ music.aname + '</td>'
									html += '<td width="5%" class="text-center"><img src="../music/play.png">'
									html+= '<input id="list'+i+'" type="hidden" data-poster="'+music.poster+'" data-size="'+music.size+'" data-altitle="'+music.altitle+'"  data-title="'+music.title+'" data-url="'+music.urlmp3+'"</td>'
									html += '</tr>'
									i += 1
								})
						$('#playListTbody').html(html)
						initPlayer()
					}
				})
	}
	});
</script>
</head>
<body>
	<div class="container" style="margin: 0px;">
		<div class="row" style="height: 400px;"></div>
		<div class="row">
			<div class="col-lg-4">
				<div id="app-cover">
					<div id="player">
						<div id="player-track">
							<img id="album-art" src="">
							<div id="album-name"></div>
							<div id="track-name"></div>
							<div id="track-time">
								<div id="current-time"></div>
								<div id="track-length"></div>
							</div>
							<div id="s-area">
								<div id="ins-time"></div>
								<div id="s-hover"></div>
								<div id="seek-bar"></div>
							</div>
						</div>
						<div id="player-content">
							<div id="player-controls">
								<div class="control">
									<div class="button" id="play-previous">
										<i class="fas fa-backward"></i>
									</div>
								</div>
								<div class="control">
									<div class="button" id="play-pause-button">
										<i class="fas fa-play"></i>
									</div>
								</div>
								<div class="control">
									<div class="button" id="play-next">
										<i class="fas fa-forward"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<table class="table">
					<thead>
						<tr>
							<th width="5%" class="text-center">¹øÈ£</th>
							<th width="7%" class="text-center"></th>
							<th width="78%" class="text-center">°îÁ¤º¸</th>
							<th width="5%" class="text-center">µè±â</th>
						</tr>
					</thead>
					<tbody id="playListTbody">
						<c:forEach var="vo" items="${list}" varStatus="i">
							<tr>
								<td width="5%" class="text-center">${i.index+1}</td>
								<td width="7%" class="text-center">${vo.poster}</td>
								<td width="78%" class="text-center">${vo.title}<br>${vo.aname}</td>
								<td width="5%" class="text-center"><img src="play.png"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>