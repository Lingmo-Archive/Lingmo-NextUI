/*
 *  SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls as QQC2
import org.kde.lingmoui as LingmoUI

LingmoUI.ApplicationWindow {
    id: root
    width: LingmoUI.Units.gridUnit * 60
    height: LingmoUI.Units.gridUnit * 40


    pageStack.initialPage: mainPageComponent
    globalDrawer: LingmoUI.OverlayDrawer {
        id: drawer
        drawerOpen: true
        modal: false
        //leftPadding: LingmoUI.Units.largeSpacing
        rightPadding: LingmoUI.Units.largeSpacing
        contentItem: ColumnLayout {
            Layout.preferredWidth: LingmoUI.Units.gridUnit * 20

            QQC2.Label {
                Layout.alignment: Qt.AlignHCenter
                text: "This is a sidebar"
                Layout.fillWidth: true
                width: parent.width - LingmoUI.Units.smallSpacing * 2
                wrapMode: Text.WordWrap
            }
            QQC2.Button {
                Layout.alignment: Qt.AlignHCenter
                text: "Modal"
                checkable: true
                Layout.fillWidth: true
                checked: false
                onCheckedChanged: drawer.modal = checked
            }
            Item {
                Layout.fillHeight: true
            }
        }
    }
    contextDrawer: LingmoUI.OverlayDrawer {
        id: contextDrawer
        drawerOpen: true
        edge: Qt.application.layoutDirection === Qt.RightToLeft ? Qt.LeftEdge : Qt.RightEdge
        modal: false
        leftPadding: LingmoUI.Units.largeSpacing
        rightPadding: LingmoUI.Units.largeSpacing
        contentItem: ColumnLayout {
            Layout.preferredWidth: LingmoUI.Units.gridUnit * 10

            QQC2.Label {
                Layout.alignment: Qt.AlignHCenter
                text: "This is a sidebar"
                Layout.fillWidth: true
                width: parent.width - LingmoUI.Units.smallSpacing * 2
                wrapMode: Text.WordWrap
            }
            QQC2.Button {
                Layout.alignment: Qt.AlignHCenter
                text: "Modal"
                checkable: true
                Layout.fillWidth: true
                checked: false
                onCheckedChanged: contextDrawer.modal = checked
            }
            Item {
                Layout.fillHeight: true
            }
        }
    }

    menuBar: QQC2.MenuBar {
        QQC2.Menu {
            title: qsTr("&File")
            QQC2.Action { text: qsTr("&New...") }
            QQC2.Action { text: qsTr("&Open...") }
            QQC2.Action { text: qsTr("&Save") }
            QQC2.Action { text: qsTr("Save &As...") }
            QQC2.MenuSeparator { }
            QQC2.Action { text: qsTr("&Quit") }
        }
        QQC2.Menu {
            title: qsTr("&Edit")
            QQC2.Action { text: qsTr("Cu&t") }
            QQC2.Action { text: qsTr("&Copy") }
            QQC2.Action { text: qsTr("&Paste") }
        }
        QQC2.Menu {
            title: qsTr("&Help")
            QQC2.Action { text: qsTr("&About") }
        }
    }
    header: QQC2.ToolBar {
        contentItem: RowLayout {
            QQC2.ToolButton {
                text: "Global ToolBar"
            }
            Item {
                Layout.fillWidth: true
            }
            LingmoUI.ActionTextField {
                id: searchField

                placeholderText: "Search…"

                focusSequence: StandardKey.Find
                leftActions: [
                    LingmoUI.Action {
                        icon.name: "edit-clear"
                        visible: searchField.text.length > 0
                        onTriggered: {
                            searchField.text = ""
                            searchField.accepted()
                        }
                    },
                    LingmoUI.Action {
                        icon.name: "edit-clear"
                        visible: searchField.text.length > 0
                        onTriggered: {
                            searchField.text = ""
                            searchField.accepted()
                        }
                    }
                ]
                rightActions: [
                    LingmoUI.Action {
                        icon.name: "edit-clear"
                        visible: searchField.text.length > 0
                        onTriggered: {
                            searchField.text = ""
                            searchField.accepted()
                        }
                    },
                    LingmoUI.Action {
                        icon.name: "anchor"
                        visible: searchField.text.length > 0
                        onTriggered: {
                            searchField.text = ""
                            searchField.accepted()
                        }
                    }
                ]

                onAccepted: console.log("Search text is " + searchField.text)
            }
        }
    }
    //Main app content
    Component {
        id: mainPageComponent
        MultipleColumnsGallery {}
    }
    footer: QQC2.ToolBar {
        position: QQC2.ToolBar.Footer
        QQC2.Label {
            anchors.fill: parent
            verticalAlignment: Qt.AlignVCenter
            text: "Global Footer"
        }
    }
}
