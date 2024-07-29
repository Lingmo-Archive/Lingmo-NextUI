/*
    SPDX-FileCopyrightText: 2021 Devin Lin <espidev@gmail.com>
    SPDX-FileCopyrightText: 2023 ivan tkachenko <me@ratijas.tk>
    SPDX-License-Identifier: GPL-2.0-or-later
*/

pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts
import QtQuick.Templates as T
import org.kde.lingmoui as LingmoUI

/**
 * A dialog that prompts users with a context menu, with
 * list items that perform actions.
 *
 * Example usage:
 * @code{.qml}
 * LingmoUI.MenuDialog {
 *     title: i18n("Track Options")
 *
 *     actions: [
 *         LingmoUI.Action {
 *             icon.name: "media-playback-start"
 *             text: i18nc("Start playback of the selected track", "Play")
 *             tooltip: i18n("Start playback of the selected track")
 *         },
 *         LingmoUI.Action {
 *             enabled: false
 *             icon.name: "document-open-folder"
 *             text: i18nc("Show the file for this song in the file manager", "Show in folder")
 *             tooltip: i18n("Show the file for this song in the file manager")
 *         },
 *         LingmoUI.Action {
 *             icon.name: "documentinfo"
 *             text: i18nc("Show track metadata", "View details")
 *             tooltip: i18n("Show track metadata")
 *         },
 *         LingmoUI.Action {
 *             icon.name: "list-add"
 *             text: i18nc("Add the track to the queue, right after the current track", "Play next")
 *             tooltip: i18n("Add the track to the queue, right after the current track")
 *         },
 *         LingmoUI.Action {
 *             icon.name: "list-add"
 *             text: i18nc("Enqueue current track", "Add to queue")
 *             tooltip: i18n("Enqueue current track")
 *         }
 *     ]
 * }
 * @endcode
 *
 * @see Dialog
 * @see PromptDialog
 * @inherit org::kde::lingmoui::Dialog
 */
LingmoUI.Dialog {
    id: root

    /**
     * @brief This property holds the actions displayed in the context menu.
     */
    property list<T.Action> actions

    /**
     * @brief This property holds the content header, which appears above the actions.
     * but below the header bar.
     */
    property alias contentHeader: columnHeader.contentItem

    /**
     * @brief This property holds the content header.
     *
     * This makes it possible to access its internal properties to, for example, change its padding:
     * ``contentHeaderControl.topPadding``
     *
     * @property QtQuick.Controls.Control contentHeaderControl
     */
    property alias contentHeaderControl: columnHeader

    preferredWidth: LingmoUI.Units.gridUnit * 20
    padding: 0

    ColumnLayout {
        id: column

        spacing: 0

        QQC2.Control {
            id: columnHeader

            topPadding: 0
            leftPadding: 0
            rightPadding: 0
            bottomPadding: 0
        }

        Repeater {
            model: root.actions

            delegate: QQC2.ItemDelegate {
                required property T.Action modelData

                Layout.fillWidth: true
                Layout.preferredHeight: LingmoUI.Units.gridUnit * 2

                action: modelData
                visible: !(modelData instanceof LingmoUI.Action) || modelData.visible

                icon.width: LingmoUI.Units.gridUnit
                icon.height: LingmoUI.Units.gridUnit

                horizontalPadding: LingmoUI.Units.largeSpacing + LingmoUI.Units.smallSpacing
                leftPadding: undefined
                rightPadding: undefined

                QQC2.ToolTip.text: modelData instanceof LingmoUI.Action ? modelData.tooltip : ""
                QQC2.ToolTip.visible: QQC2.ToolTip.text.length > 0 && (LingmoUI.Settings.tabletMode ? pressed : hovered)
                QQC2.ToolTip.delay: LingmoUI.Settings.tabletMode ? Qt.styleHints.mousePressAndHoldInterval : LingmoUI.Units.toolTipDelay

                onClicked: root.close()
            }
        }
    }

    standardButtons: QQC2.DialogButtonBox.NoButton
    showCloseButton: true
}
