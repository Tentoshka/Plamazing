import QtQuick 2.14
import QtQuick.Window 2.14
import QtMultimedia 5.12
import QtQuick.Controls 2.5

Video {
    MouseArea {
        anchors.fill: parent
        onClicked: {
            video.playbackState === MediaPlayer.PlayingState ? video.pause() : video.play()
        }
    }
    
    Menu {}

    Keys.onSpacePressed: video.playbackState === MediaPlayer.PlayingState ? video.pause() : video.play()
    Keys.onLeftPressed: video.seek(video.position - 5000)
    Keys.onRightPressed: video.seek(video.position + 5000)
    Keys.onUpPressed: video.volume += 0.1
    Keys.onDownPressed: video.volume -= 0.1
}
