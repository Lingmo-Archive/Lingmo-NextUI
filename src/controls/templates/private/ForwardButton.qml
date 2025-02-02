/*
 *  SPDX-FileCopyrightText: 2016 Marco Martin <mart@kde.org>
 *
 *  SPDX-License-Identifier: LGPL-2.0-or-later
 */

import QtQuick
import QtQuick.Controls as QQC2
import org.kde.lingmoui as LingmoUI

QQC2.ToolButton {
    id: button

    icon.name: (LayoutMirroring.enabled ? "go-next-symbolic-rtl" : "go-next-symbolic")

    enabled: applicationWindow().pageStack.currentIndex < applicationWindow().pageStack.depth-1

    // The gridUnit wiggle room is used to not flicker the button visibility during an animated resize for instance due to a sidebar collapse
    visible: {
        const pageStack = applicationWindow().pageStack;
        const showNavButtons = globalToolBar?.showNavigationButtons ?? LingmoUI.ApplicationHeaderStyle.NoNavigationButtons;
        return pageStack.layers.depth === 1 && pageStack.contentItem.contentWidth > pageStack.width + LingmoUI.Units.gridUnit && (showNavButtons & LingmoUI.ApplicationHeaderStyle.ShowForwardButton);
    }

    onClicked: applicationWindow().pageStack.goForward();

    text: qsTr("Navigate Forward")
    display: QQC2.ToolButton.IconOnly

    QQC2.ToolTip {
        visible: button.hovered
        text: button.text
        delay: LingmoUI.Units.toolTipDelay
        y: button.height
    }
}
