import QtQuick 2.1


Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }
    Text {
            id: logo
            text: 'Enter the Matrix of Possibilities'
            font.pointSize: 52
            color: "#FF6534"
            opacity:0.85
            font { family: "VALORANT"; weight: Font.Light ;/*capitalization: Font.Capitalize*/}
             anchors{
                 horizontalCenter:parent.horizontalCenter
                 topMargin:100
                 top:parent.top
             }
        }

    Image {
        id: topRect
        anchors.horizontalCenter: parent.horizontalCenter
        y: root.height
        source: "images/rectangle.png"
        // AnimatedImage {
        //     source: "images/kde.gif"
        //     anchors.centerIn: parent
        // }
        Rectangle {
            radius: 1
            color: "#478FC4"
            anchors { 
                bottom: parent.bottom
                bottomMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            height: 4
            width: height*180
            Rectangle {
                radius: 1
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: (parent.width / 5) * (stage - 1)
                color: "#d1abff"
                Behavior on width { 
                    PropertyAnimation {
                        duration: 350
                        easing.type: Easing.InOutQuad
                    }
                }
            }
        }
        Text {
            id: date
            text:Qt.formatDateTime(new Date(),"dddd d MMMM, hh:mm AP")
            font.pointSize: 32
            color: "#E4577F"
            opacity:0.85
            font { family: "Galiver Sans Obliques"; weight: Font.Light ;/*capitalization: Font.Capitalize*/}
            anchors.horizontalCenter: parent.horizontalCenter
            y: (parent.height - height) / 2.7
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                target: topRect
                to: root.height / 1.5
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 1.5) - bottomRect.height
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.5
            }
        }
    }
}
