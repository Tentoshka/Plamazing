import QtQuick 2.14
import QtQuick.Window 2.14
import QtMultimedia 5.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.3

Window {
    id: window
    visible: true
    minimumWidth: 640
    minimumHeight: 480
    color: "#2c2c2c"
    title: qsTr("Plamazing")

    property var fileWay: ""

    VideoPlayer {
        id: video
        y: 24
        anchors.bottom: window.bottom
        focus: true
        height: parent.height - toolBar.height
        width: parent.width
        source: fileWay
    }

    ToolBar {
        id: toolBar
        y: 0
        width: parent.width
        height: 24

        Button {
            id: button
            x: 0
            y: 0
            width: 50
            height: parent.height
            text: qsTr("Open")

            onClicked:
            {
                fileDialog.visible = true
            }
        }
    }

    FileDialog {
        id: fileDialog
        visible: false
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            fileWay = fileDialog.fileUrl
        }
        onRejected: {
        }
    }
}

