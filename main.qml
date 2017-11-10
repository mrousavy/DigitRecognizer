import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.0

ApplicationWindow {
    visible: true
    minimumWidth: 200
    width: 640
    minimumHeight: 150
    height: 480
    id: window
    title: qsTr("BrabeNetz - Digit Recognizer")

    // Variables
    property string stateFile : ""

    // File picker for state.nn
    FileDialog {
        id: fileDialog
        title: "Please choose a trained state.nn file"
        nameFilters: [ "BrabeNetz Network State (*.nn)" ]
        folder: shortcuts.home
        onAccepted: {
            console.log(fileDialog.fileUrls)
            stateFile = fileDialog.fileUrl
            split = stateFile.toString().split(".")
            shortName = split[split.length]
            // TODO: READ TOPOLOGY
            headerLabel.text = "BrabeNetz - Digit Recognizer on " + stateFile + ": {x}"
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    // Header
    header: ToolBar {
        RowLayout {
            anchors.fill: parent
            ToolButton {
                text: qsTr("?")
                onClicked: Qt.openUrlExternally("http://github.com/mrousavy/BrabeNetz")
            }
            Label {
                id: headerLabel
                text: "BrabeNetz - Digit Recognizer on state.nn: {784,500,100,10}"
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }
            ToolButton {
                text: qsTr("⋮")
                onClicked: fileDialog.open()
            }
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        property int lastX: 0
        property int lastY: 0

        onPaint: {
            var ctx = getContext("2d")
            ctx.lineWidth = 5
            ctx.strokeStyle = color.red
            ctx.beginPath()
            ctx.moveTo(lastX, lastY)
            lastX = area.mouseX
            lastY = area.mouseY
            ctx.lineTo(lastX, lastY)
            ctx.stroke()
        }


        MouseArea {
            id: area
            anchors.fill: parent
            onPressed: {
                canvas.lastX = mouseX
                canvas.lastY = mouseY
            }

            onPositionChanged: {
                canvas.requestPaint()
            }
        }
    }
}
