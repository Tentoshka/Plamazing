import QtQuick 2.14
import QtQuick.Window 2.14
import QtMultimedia 5.12
import QtQuick.Controls 2.5

Rectangle {
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    opacity: 0.1

    // Кнопки управления воспроизведением
    Rectangle {
        id: backBtn
        x: pauseBtn.x - this.width - 8
        y: pauseBtn.y
        width: 59
        height: 59
        color: "#ffffff"
        
        radius: 100
        
        MouseArea {
            anchors.fill: parent
            
            onClicked: video.seek(video.position - 5000)
        }
        Text {
            anchors.fill: parent
            text: qsTr("<")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 64
        }
    }
    
    Rectangle {
        id: pauseBtn
        x: parent.width / 2 - this.width / 2
        y: parent.height - 8 - volumeSlider.height - 8 - this.height
        width: 59
        height: 59
        color: "#ffffff"
        radius: 10
        
        MouseArea {
            anchors.fill: parent
            
            onEntered: {
                opacity: 0.4
            }
            
            onClicked: {
                video.playbackState === MediaPlayer.PlayingState ? video.pause() : video.play()
            }
        }
        Text {
            id:pauseText
            anchors.fill: parent
            text: qsTr("||")
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 51
        }
    }
    
    Rectangle {
        id: nextBtn
        x: pauseBtn.x + this.width + 8
        y: pauseBtn.y
        width: 59
        height: 59
        color: "#ffffff"
        radius: 100
        
        MouseArea {
            anchors.fill: parent
            
            onEntered: {
                opacity: 0.4
            }
            
            onClicked: video.seek(video.position + 5000)
        }
        Text {
            anchors.fill: parent
            text: qsTr(">")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 64
        }
    }

    // Слайдер регулировки громкости
    Slider {
        id: volumeSlider
        y: parent.height - 8 - this.height
        x: video.width - 8 - this.width - parent.x
        from: 0
        to: 1
        value: 1
        onMoved: {
            video.volume = value
        }
        Component.onCompleted: {
            video.volume = value
        }
    }

    // Полоска видео
    Slider {
        id: timeSlider
        y: volumeSlider.y
        anchors.right: volumeSlider.left
        width: window.width - 16 - 8 - volumeSlider.width
        from: 0
        to: video.duration
        value: video.position
        onMoved: {
            video.seek(value)
        }
    }
}
