# Directory 目录

---

## [官方文档](https://code.visualstudio.com/api/references/theme-color)

> [Theme Color 主题颜色](#theme-color-主题颜色)
>
> [Color formats 颜色格式](#color-formats-颜色格式)
>
> [Contrast colors 对比色](#contrast-colors-对比色)
>
> [Base colors 基本颜色](#base-colors-基本颜色)
>
> [Window border 窗口颜色](#window-border-窗口颜色)
>
> [Text colors 文本颜色](#text-colors-文本颜色)
>
> [Action colors 操作栏颜色](#action-colors-操作栏颜色)
>
> [Button control 按钮](#button-control-按钮)
>
> [Dropdown control 下拉菜单](#dropdown-control-下拉菜单)
>
> [Input control 输入](#input-control-输入)
>
> [Scrollbar control 滚动条](#scrollbar-control-滚动条)
>
> [Badge 徽章](#badge-徽章)
>
> [Progress bar 进度条](#progress-bar-进度条)
>
> [Lists and trees 列表和树](#lists-and-trees-列表和树)
>
> [Activity Bar 活动栏](#activity-bar-活动栏)
>
> [Profiles 配置文件](#profiles-配置文件)
>
> [Side Bar 侧边栏](#side-bar-侧边栏)
>
> [Minimap 代码缩略图](#minimap-代码缩略图)
>
> [Editor Groups & Tabs 编辑器组 & 标签页](#editor-groups--tabs-编辑器组--标签页)
>
> [Editor colors 编辑器颜色](#editor-colors-编辑器颜色)
>
> [selection highlight 选择区域高亮](#selection-highlight-选择区域高亮)
>
> [occurrences 词语感知](#occurrences-词语感知)
>
> [Find matches 查找匹配项](#find-matches-查找匹配项)
>
> [Title Bar colors 标题栏颜色](#title-bar-colors-标题栏颜色)

---

# Theme Color 主题颜色

[Back to Directory 返回目录](#directory-目录)

You can customize your active Visual Studio Code color theme with the `workbench.colorCustomizations` user setting.

你可以通过 `workbench.colorCustomizations` 用户设置(settings.json)来自定义你当前激活的 Visual Studio Code 颜色主题。

```
{
    "workbench.colorCustomizations": {
      "activityBar.background": "#00AA00"
    }
}
```

Note:

> If you want to use an existing color theme, see Color Themes where you'll > learn how to set the active color theme through the Preferences: Color Theme dropdown (Ctrl+K Ctrl+T).

> 如果你想使用现有的颜色主题，请查看颜色主题部分，在那里你将学习如何通过“首选项：颜色主题”下拉菜单（Ctrl+K Ctrl+T）设置当前激活的颜色主题。

```
"workbench.colorTheme": "Dark",
```

Theme colors are available as CSS variables in webviews, and an extension is available which provides IntelliSense for them.

主题颜色在网页视图中可作为 CSS 变量使用，并且有一个扩展可以为它们提供 IntelliSense (智能感知)支持。

## Color formats 颜色格式

[Back to Directory 返回目录](#directory-目录)

Color values can be defined in the RGB color model with an alpha channel for transparency. As format, the following hexadecimal notations are supported: #RGB, #RGBA, #RRGGBB and #RRGGBBAA.

R (red), G (green), B (blue), and A (alpha) are hexadecimal characters (0-9, a-f or A-F).

The three-digit notation (#RGB) is a shorter version of the six-digit form (#RRGGBB) and the four-digit RGB notation (#RGBA) is a shorter version of the eight-digit form (#RRGGBBAA). For example #e35f is the same color as #ee3355ff.

颜色值可以在 RGB 颜色模型中定义，并通过一个 Alpha 通道来表示透明度。支持以下十六进制表示法：#RGB, #RGBA, #RRGGBB 和 #RRGGBBAA。

R（红）、G（绿）、B（蓝）和 A（Alpha）是十六进制字符（0-9, a-f 或 A-F）。

三位表示法（#RGB）是六位形式（#RRGGBB）的简写，四位 RGB 表示法（#RGBA）是八位形式（#RRGGBBAA）的简写。例如，#e35f 与 #ee3355ff 表示相同的颜色。

If no alpha value is defined, it defaults to ff (opaque, no transparency). If alpha is set to 00, the color is fully transparent.

如果没有定义 Alpha 值，它默认值为 ff（不透明，没有透明度）。如果 Alpha 设置为 00，则颜色完全透明。

Some colors should not be opaque in order to not cover other annotations. Check the color descriptions to see to which colors this applies.

某些颜色不应该是不透明的，以免遮盖其他注释。请检查颜色描述以确定这些颜色适用的情况。

## Contrast colors 对比色

[Back to Directory 返回目录](#directory-目录)

The contrast colors are typically only set for high contrast themes. If set, they add an additional border around items across the UI to increase the contrast.

对比色通常只在高对比度主题中设置。如果设置。如果设置了，它们会在界面各项元素周围增加一个额外的边框以提高对比度。

`contrastActiveBorder`: An extra border around **active** elements to separate them from others for greater contrast.

在**活动**元素周围增加一个额外的边框，以将它们与其他元素分开，从而提高对比度。

`contrastBorder`: An extra border around elements to separate them from others for greater contrast.

在元素周围增加一个额外的边框，以将它们与其他元素分开，从而提高对比度。

## Base colors 基本颜色

[Back to Directory 返回目录](#directory-目录)

`focusBorder`: Overall border color for focused elements. This color is only used if not overridden by a component.

焦点所在的元素的整体边框颜色。(此颜色仅在未被组件覆盖时使用，下同)

`foreground`: Overall foreground color. This color is only used if not overridden by a component.

整体前景色。

`disabledForeground`: Overall foreground for disabled elements. This color is only used if not overridden by a component.

被禁用元素的整体前景色

`widget.border`: **Border** color of widgets such as Find/Replace inside the editor.

编辑器内如查找/替换等控件的**边框**颜色

`widget.shadow`: **Shadow** color of widgets such as Find/Replace inside the editor.

编辑器内如查找/替换等控件的**阴影**颜色

`selection.background`: Background color of text selections in the workbench (for input fields or text areas, does not apply to selections within the editor and the terminal).

用户界面(workbench)中文本选择的背景颜色（适用于输入字段或文本区域，不适用于编辑器和终端内的选择）

`descriptionForeground`: Foreground color for description text providing additional information, for example for a label.

用于提供附加信息的描述文本的前景颜色，例如标签的文本颜色。

`errorForeground`: Overall foreground color for error messages (this color is only used if not overridden by a component).

错误消息的整体前景颜色

`icon.foreground`: The default color for icons in the workbench.

用户界面中图标的默认颜色

`sash.hoverBorder`: The hover border color for draggable sashes.

可拖动分割线的悬停边框颜色

## Window border 窗口颜色

[Back to Directory 返回目录](#directory-目录)

The theme colors for VS Code window border.

VS Code 窗口边框的主题颜色

`window.activeBorder`: Border color for the active (focused) window.

活动（聚焦）的窗口的边框颜色

`window.inactiveBorder`: Border color for the inactive (unfocused) windows.

未活动（未聚焦）的窗口的边框颜色

The window border colors are only supported on macOS and Linux (not Windows) and only when the custom title bar is enabled ("window.titleBarStyle": "custom").

窗口边框颜色仅在 macOS 和 Linux 上支持（不支持 Windows），并且只有在启用自定义标题栏时（"window.titleBarStyle": "custom"）才有效

## Text colors 文本颜色

[Back to Directory 返回目录](#directory-目录)

Colors inside a text document, such as the welcome page.

文本文档中的颜色，例如欢迎页面

`textBlockQuote.background`: Background color for block quotes in text.

文本中引用块的背景颜色

`textBlockQuote.border`: Border color for block quotes in text.

文本中引用块的边框颜色

`textCodeBlock.background`: Background color for code blocks in text.

文本中代码块的边框颜色

`textLink.activeForeground`: Foreground color for links in text when clicked on and on mouse hover.

在文本中，当链接被点击或鼠标悬停时的前景颜色

`textLink.foreground`: Foreground color for links in text.

在文本中，链接的前景颜色

`textPreformat.foreground`: Foreground color for preformatted text segments.

在文本中，预格式化文本段落的前景颜色

`textPreformat.background`: Background color for preformatted text segments.

在文本中，预格式化文本段落的背景颜色

`textSeparator.foreground`: Color for text separators.

文本分隔符颜色

## Action colors 操作栏颜色

[Back to Directory 返回目录](#directory-目录)

A set of colors to control the interactions with actions across the workbench.

一组用于控制行为与操作栏(vscode 内第二层的栏目,如:'更多操作...')交互的颜色。

`toolbar.hoverBackground`: Toolbar background when hovering over actions using the mouse

鼠标悬停在操作上的工具栏背景。

`toolbar.hoverOutline`: Toolbar outline when hovering over actions using the mouse

`toolbar.activeBackground`: Toolbar background when holding the mouse over actions

`editorActionList.background`: Action List background color.

`editorActionList.foreground`: Action List foreground color.

`editorActionList.focusForeground`: Action List foreground color for the focused item.

`editorActionList.focusBackground`: Action List background color for the focused item.

## Button control 按钮

[Back to Directory 返回目录](#directory-目录)

A set of colors for button widgets such as Open Folder button in the Explorer of a new window.

按钮小部件（如侧边栏窗口资源管理器中的“打开文件夹”按钮）的一组颜色

`button.background`: Button background color.

按钮背景颜色

`button.foreground`: Button foreground color.

按钮前景颜色

`button.border`: Button border color.

按钮边框颜色

`button.separator`: Button separator color.

按钮分隔符颜色

`button.hoverBackground`: Button background color when hovering.

悬停时按钮背景颜色

`button.secondaryForeground`: Secondary button foreground color.

次要按钮前景颜色

`button.secondaryBackground`: Secondary button background color.

次要按钮背景颜色

`button.secondaryHoverBackground`: Secondary button background color when hovering.

悬停时次要按钮背景颜色

`checkbox.background`: Background color of checkbox widget.

复选框小部件的背景颜色

`checkbox.foreground`: Foreground color of checkbox widget.

复选框小部件的前景颜色

`checkbox.border`: Border color of checkbox widget.

复选框小部件的边框颜色

`checkbox.selectBackground`: Background color of checkbox widget when the element it's in is selected.

复选框小部件所在元素被选中时的背景颜色

`checkbox.selectBorder`: Border color of checkbox widget when the element it's in is selected.

复选框小部件所在元素被选中时的边框颜色

`radio.activeForeground`: Foreground color of active radio option.

活动单选项的前景颜色

`radio.activeBackground`: Background color of active radio option.

活动单选项的背景颜色

`radio.activeBorder`: Border color of the active radio option.

活动单选项的边框颜色

`radio.inactiveForeground`: Foreground color of inactive radio option.

非活动单选项的前景颜色

`radio.inactiveBackground`: Background color of inactive radio option.

非活动单选项的背景颜色

`radio.inactiveBorder`: Border color of the inactive radio option.

非活动单选项的边框颜色

`radio.inactiveHoverBackground`: Background color of inactive active radio option when hovering.

悬停时非活动单选项的背景颜色

## Dropdown control 下拉菜单

[Back to Directory 返回目录](#directory-目录)

A set of colors for all Dropdown widgets such as in the Integrated Terminal or the Output panel. Note that the Dropdown control is not used on macOS currently.

dropdown control

dropdown.background: Dropdown background.

dropdown.listBackground: Dropdown list background.

dropdown.border: Dropdown border.

dropdown.foreground: Dropdown foreground.

## Input control 输入

[Back to Directory 返回目录](#directory-目录)

Colors for input controls such as in the Search view or the Find/Replace dialog.

input control

input.background: Input box background.

input.border: Input box border.

input.foreground: Input box foreground.

input.placeholderForeground: Input box foreground color for placeholder text.

inputOption.activeBackground: Background color of activated options in input fields.

inputOption.activeBorder: Border color of activated options in input fields.

inputOption.activeForeground: Foreground color of activated options in input fields.

inputOption.hoverBackground: Background color of activated options in input fields.

inputValidation.errorBackground: Input validation background color for error severity.

inputValidation.errorForeground: Input validation foreground color for error severity.

inputValidation.errorBorder: Input validation border color for error severity.

inputValidation.infoBackground: Input validation background color for information severity.

inputValidation.infoForeground: Input validation foreground color for information severity.

inputValidation.infoBorder: Input validation border color for information severity.

inputValidation.warningBackground: Input validation background color for information warning.

inputValidation.warningForeground: Input validation foreground color for warning severity.

inputValidation.warningBorder: Input validation border color for warning severity.

## Scrollbar control 滚动条

[Back to Directory 返回目录](#directory-目录)

scrollbar.shadow: Scrollbar slider shadow to indicate that the view is scrolled.

scrollbarSlider.activeBackground: Scrollbar slider background color when clicked on.

scrollbarSlider.background: Scrollbar slider background color.

scrollbarSlider.hoverBackground: Scrollbar slider background color when hovering.

## Badge 徽章

[Back to Directory 返回目录](#directory-目录)

Badges are small information labels, for example, search results count.

徽章是小型信息标签，例如侧边栏搜索结果计数: 其中圆角边框包含数字的整体

badge.foreground: Badge foreground color.

badge.background: Badge background color.

## Progress bar 进度条

[Back to Directory 返回目录](#directory-目录)

progressBar.background: Background color of the progress bar shown for long running operations.

## Lists and trees 列表和树

[Back to Directory 返回目录](#directory-目录)

Colors for list and trees like the File Explorer. An active list/tree has keyboard focus, an inactive does not.

在 GUI 设计中，列表和树形结构（如资源管理器）常用不同的颜色来区分其状态

`list.activeSelectionBackground`: List/Tree background color for the selected item when the list/tree is active.

列表/树处于活动状态时选定项的背景颜色。

`list.activeSelectionForeground`: List/Tree foreground color for the selected item when the list/tree is active.

列表/树处于活动状态时选定项的前景颜色。

`list.activeSelectionIconForeground`: List/Tree icon foreground color for the selected item when the list/tree is active. An active list/tree has keyboard focus, an inactive does not.

列表/树处于活动状态时选定项的图标前景颜色。活动列表/树具有键盘焦点，非活动列表/树则没有。

`list.dropBackground`: List/Tree drag and drop background when moving items around using the mouse.

使用鼠标移动项目时列表/树的拖放背景颜色。

`list.focusBackground`: List/Tree background color for the focused item when the list/tree is active.

列表/树处于活动状态时聚焦项的背景颜色。

`list.focusForeground`: List/Tree foreground color for the focused item when the list/tree is active. An active list/tree has keyboard focus, an inactive does not.

列表/树处于活动状态时聚焦项的前景颜色。活动列表/树具有键盘焦点，非活动列表/树则没有。

`list.focusHighlightForeground`: List/Tree foreground color of the match highlights on actively focused items when searching inside the list/tree.

在列表/树中搜索时，活动聚焦项的匹配高亮前景颜色。

`list.focusOutline`: List/Tree outline color for the focused item when the list/tree is active. An active list/tree has keyboard focus, an inactive does not.

列表/树处于活动状态时聚焦项的轮廓颜色。活动列表/树具有键盘焦点，非活动列表/树则没有。

`list.focusAndSelectionOutline`: List/Tree outline color for the focused item when the list/tree is active and selected. An active list/tree has keyboard focus, an inactive does not.

列表/树处于活动状态且被选中时聚焦项的轮廓颜色。活动列表/树具有键盘焦点，非活动列表/树则没有。

`list.highlightForeground`: List/Tree foreground color of the match highlights when searching inside the list/tree.

在列表/树中搜索时匹配高亮的前景颜色。

`list.hoverBackground`: List/Tree background when hovering over items using the mouse.

使用鼠标悬停在项目上时列表/树的背景颜色。

`list.hoverForeground`: List/Tree foreground when hovering over items using the mouse.

使用鼠标悬停在项目上时列表/树的前景颜色。

`list.inactiveSelectionBackground`: List/Tree background color for the selected item when the list/tree is inactive.

列表/树处于非活动状态时选定项的背景颜色。

`list.inactiveSelectionForeground`: List/Tree foreground color for the selected item when the list/tree is inactive. An active list/tree has keyboard focus, an inactive does not.

列表/树处于非活动状态时选定项的前景颜色。活动列表/树具有键盘焦点，非活动列表/树则没有。

`list.inactiveSelectionIconForeground`: List/Tree icon foreground color for the selected item when the list/tree is inactive. An active list/tree has keyboard focus, an inactive does not.

列表/树处于非活动状态时选定项的图标前景颜色。活动列表/树具有键盘焦点，非活动列表/树则没有。

`list.inactiveFocusBackground`: List background color for the focused item when the list is inactive. An active list has keyboard focus, an inactive does not. Currently only supported in lists.

列表处于非活动状态时聚焦项的背景颜色。活动列表具有键盘焦点，非活动列表则没有。目前仅支持列表。

`list.inactiveFocusOutline`: List/Tree outline color for the focused item when the list/tree is inactive. An active list/tree has keyboard focus, an inactive does not.

列表/树处于非活动状态时聚焦项的轮廓颜色。活动列表/树具有键盘焦点，非活动列表/树则没有。

`list.invalidItemForeground`: List/Tree foreground color for invalid items, for example an unresolved root in explorer.

无效项目的列表/树前景颜色，例如资源管理器中未解析的根。

`list.errorForeground`: Foreground color of list items containing errors.

包含错误的列表项的前景颜色。

`list.warningForeground`: Foreground color of list items containing warnings.

包含警告的列表项的前景颜色。

`listFilterWidget.background`: List/Tree Filter background color of typed text when searching inside the list/tree.

在列表/树中搜索时输入文本的过滤器背景颜色。

`listFilterWidget.outline`: List/Tree Filter Widget's outline color of typed text when searching inside the list/tree.

在列表/树中搜索时输入文本的过滤器小部件轮廓颜色。

`listFilterWidget.noMatchesOutline`: List/Tree Filter Widget's outline color when no match is found of typed text when searching inside the list/tree.

在列表/树中搜索时未找到匹配项时输入文本的过滤器小部件轮廓颜色。

`listFilterWidget.shadow`: Shadow color of the type filter widget in lists and tree.

列表和树中类型过滤器小部件的阴影颜色。

`list.filterMatchBackground`: Background color of the filtered matches in lists and trees.

列表和树中过滤匹配项的背景颜色。

`list.filterMatchBorder`: Border color of the filtered matches in lists and trees.

列表和树中过滤匹配项的边框颜色。

`list.deemphasizedForeground`: List/Tree foreground color for items that are deemphasized.

被弱化项目的列表/树前景颜色。

`list.dropBetweenBackground`: List/Tree drag and drop border color when moving items between items when using the mouse.

使用鼠标在项目之间移动项目时列表/树的拖放边框颜色。

`tree.indentGuidesStroke`: Tree Widget's stroke color for indent guides.

树形小部件的缩进指南描边颜色。

`tree.inactiveIndentGuidesStroke`: Tree stroke color for the indentation guides that are not active.

非活动缩进指南的树形描边颜色。

`tree.tableColumnsBorder`: Tree stroke color for the indentation guides.

树形缩进指南的描边颜色。

`tree.tableOddRowsBackground`: Background color for odd table rows.

奇数表格行的背景颜色。

## Activity Bar 活动栏

[Back to Directory 返回目录](#directory-目录)

The Activity Bar is usually displayed either on the far left or right of the workbench and allows fast switching between views of the Side Bar.

活动栏通常显示在工作台的最左侧或最右侧，允许快速切换侧边栏的视图。

`activityBar.background`: Activity Bar background color.

`activityBar.dropBorder`: Drag and drop feedback color for the activity bar items. The activity bar is showing on the far left or right and allows to switch between views of the side bar.

将活动栏项目的反馈颜色拖放到活动栏上。活动栏显示在最左侧或最右侧，允许在侧边栏的不同视图之间切换。

activityBar.foreground: Activity Bar foreground color (for example used for the icons).

activityBar.inactiveForeground: Activity Bar item foreground color when it is inactive.

activityBar.border: Activity Bar border color with the Side Bar.

activityBarBadge.background: Activity notification badge background color.

activityBarBadge.foreground: Activity notification badge foreground color.

activityBar.activeBorder: Activity Bar active indicator border color.

activityBar.activeBackground: Activity Bar optional background color for the active element.

activityBar.activeFocusBorder: Activity bar focus border color for the active item.

activityBarTop.foreground: Active foreground color of the item in the Activity bar when it is on top. The activity allows to switch between views of the side bar.

activityBarTop.activeBorder: Focus border color for the active item in the Activity bar when it is on top. The activity allows to switch between views of the side bar.

activityBarTop.inactiveForeground: Inactive foreground color of the item in the Activity bar when it is on top. The activity allows to switch between views of the side bar.

activityBarTop.dropBorder: Drag and drop feedback color for the items in the Activity bar when it is on top. The activity allows to switch between views of the side bar.

activityBarTop.background: Background color of the activity bar when set to top / bottom.

activityBarTop.activeBackground: Background color for the active item in the Activity bar when it is on top / bottom. The activity allows to switch between views of the side bar.

activityWarningBadge.foreground: Foreground color of the warning activity badge

activityWarningBadge.background: Background color of the warning activity badge

activityErrorBadge.foreground: Foreground color of the error activity badge

activityErrorBadge.background: Background color of the error activity badge

## Profiles 配置文件

[Back to Directory 返回目录](#directory-目录)

`profileBadge.background`: Profile badge background color. The profile badge shows on top of the settings gear icon in the activity bar.

`profileBadge.foreground`: Profile badge foreground color. The profile badge shows on top of the settings gear icon in the activity bar.

`profiles.sashBorder`: The color of the Profiles editor splitview sash border.

## Side Bar 侧边栏

[Back to Directory 返回目录](#directory-目录)

The Side Bar contains views like the Explorer and Search.

侧边栏包含像资源管理器和搜索这样的视图

sideBar.background: Side Bar background color.

侧边栏背景颜色

sideBar.foreground: Side Bar foreground color. The Side Bar is the container for views like Explorer and Search.

侧边栏前景颜色。侧边栏是包含资源管理器、搜索等视图的容器

sideBar.border: Side Bar border color on the side separating the editor.

侧边栏与编辑器之间的边框颜色

sideBar.dropBackground: Drag and drop feedback color for the side bar sections. The color should have transparency so that the side bar sections can still shine through.

侧边栏区域拖放时的反馈颜色。该颜色应具有透明度，以便侧边栏区域的内容仍然可见

sideBarTitle.foreground: Side Bar title foreground color.

侧边栏标题的前景颜色

sideBarSectionHeader.background: Side Bar section header background color.

侧边栏区域标题的背景颜色

sideBarSectionHeader.foreground: Side Bar section header foreground color.

侧边栏区域标题的前景颜色

sideBarSectionHeader.border: Side bar section header border color.

侧边栏区域标题的边框颜色

sideBarActivityBarTop.border: Border color between the activity bar at the top/bottom and the views.

侧边栏顶部/底部与活动栏之间的边框颜色

sideBarTitle.background: Side bar title background color. The side bar is the container for views like explorer and search.

侧边栏标题的背景颜色。侧边栏是包含资源管理器、搜索等视图的容器

sideBarTitle.border: Side bar title border color on the bottom, separating the title from the views. The side bar is the container for views like explorer and search.

侧边栏标题底部的边框颜色，将标题与视图部分分隔开。侧边栏是包含资源管理器、搜索等视图的容器

sideBarStickyScroll.background: Background color of sticky scroll in the side bar.

侧边栏中的固定滚动条背景颜色

sideBarStickyScroll.border: Border color of sticky scroll in the side bar.

侧边栏中固定滚动条的边框颜色

sideBarStickyScroll.shadow: Shadow color of sticky scroll in the side bar.

侧边栏中固定滚动条的阴影颜色

## Minimap 代码缩略图

[Back to Directory 返回目录](#directory-目录)

The Minimap shows a minified version of the current file.

`minimap.findMatchHighlight`: Highlight color for matches from search within files.

`minimap.selectionHighlight`: Highlight color for the editor selection.

`minimap.errorHighlight`: Highlight color for errors within the editor.

minimap.warningHighlight: Highlight color for warnings within the editor.

`minimap.background`: Minimap background color.

minimap.selectionOccurrenceHighlight: Minimap marker color for repeating editor selections.

minimap.foregroundOpacity: Opacity of foreground elements rendered in the minimap. For example, "#000000c0" will render the elements with 75% opacity.

minimap.infoHighlight: Minimap marker color for infos.

minimapSlider.background: Minimap slider background color.

minimapSlider.hoverBackground: Minimap slider background color when hovering.

minimapSlider.activeBackground: Minimap slider background color when clicked on.

minimapGutter.addedBackground: Minimap gutter color for added content.

minimapGutter.modifiedBackground: Minimap gutter color for modified content.

minimapGutter.deletedBackground: Minimap gutter color for deleted content.

## Editor Groups & Tabs 编辑器组 & 标签页

[Back to Directory 返回目录](#directory-目录)

Editor Groups are the containers of editors. There can be many editor groups. A Tab is the container of an editor. Multiple Tabs can be opened in one editor group.

编辑器组是编辑器的容器。可以存在多个编辑器组。标签页是编辑器的容器。一个编辑器组中可以打开多个标签页。

editorGroup.border: Color to separate multiple editor groups from each other.

editorGroup.dropBackground: Background color when dragging editors around.

editorGroup.dropBackground

editorGroupHeader.noTabsBackground: Background color of the editor group title header when using single Tab (set "workbench.editor.showTabs": "single").

editorGroupHeader.noTabsBackground

editorGroupHeader.tabsBackground: Background color of the Tabs container.

editorGroupHeader.tabsBackground

editorGroupHeader.tabsBorder: Border color below the editor tabs control when tabs are enabled.

editorGroupHeader.tabsBorder

editorGroupHeader.border: Border color between editor group header and editor (below breadcrumbs if enabled).

editorGroup.emptyBackground: Background color of an empty editor group.

editorGroup.focusedEmptyBorder: Border color of an empty editor group that is focused.

editorGroup.dropIntoPromptForeground: Foreground color of text shown over editors when dragging files. This text informs the user that they can hold shift to drop into the editor.

editorGroup.dropIntoPromptBackground: Background color of text shown over editors when dragging files. This text informs the user that they can hold shift to drop into the editor.

editorGroup.dropIntoPromptBorder: Border color of text shown over editors when dragging files. This text informs the user that they can hold shift to drop into the editor.

tab.activeBackground: Active Tab background color in an active group.

tab.unfocusedActiveBackground: Active Tab background color in an inactive editor group.

tab.activeForeground: Active Tab foreground color in an active group.

tab.border: Border to separate Tabs from each other.

tab.activeBorder: Bottom border for the active tab.

tab.selectedBorderTop: Border to the top of a selected tab. Tabs are the containers for editors in the editor area. Multiple tabs can be opened in one editor group. There can be multiple editor groups.

tab.selectedBackground: Background of a selected tab. Tabs are the containers for editors in the editor area. Multiple tabs can be opened in one editor group. There can be multiple editor groups.

tab.selectedForeground: Foreground of a selected tab. Tabs are the containers for editors in the editor area. Multiple tabs can be opened in one editor group. There can be multiple editor groups.

tab.dragAndDropBorder: Border between tabs to indicate that a tab can be inserted between two tabs. Tabs are the containers for editors in the editor area. Multiple tabs can be opened in one editor group. There can be multiple editor groups.

tab.unfocusedActiveBorder: Bottom border for the active tab in an inactive editor group.

tab.activeBorderTop: Top border for the active tab.

tab.unfocusedActiveBorderTop: Top border for the active tab in an inactive editor group

tab.lastPinnedBorder: Border on the right of the last pinned editor to separate from unpinned editors.

tab.inactiveBackground: Inactive Tab background color.

tab.unfocusedInactiveBackground: Inactive Tab background color in an unfocused group

tab.inactiveForeground: Inactive Tab foreground color in an active group.

tab.unfocusedActiveForeground: Active tab foreground color in an inactive editor group.

tab.unfocusedInactiveForeground: Inactive tab foreground color in an inactive editor group.

tab.hoverBackground: Tab background color when hovering

tab.unfocusedHoverBackground: Tab background color in an unfocused group when hovering

tab.hoverForeground: Tab foreground color when hovering

tab.unfocusedHoverForeground: Tab foreground color in an unfocused group when hovering

tab.hoverBorder: Border to highlight tabs when hovering

tab.unfocusedHoverBorder: Border to highlight tabs in an unfocused group when hovering

tab.activeModifiedBorder: Border on the top of modified (dirty) active tabs in an active group.

tab.inactiveModifiedBorder: Border on the top of modified (dirty) inactive tabs in an active group.

tab.unfocusedActiveModifiedBorder: Border on the top of modified (dirty) active tabs in an unfocused group.

tab.unfocusedInactiveModifiedBorder: Border on the top of modified (dirty) inactive tabs in an unfocused group.

editorPane.background: Background color of the editor pane visible on the left and right side of the centered editor layout.

sideBySideEditor.horizontalBorder: Color to separate two editors from each other when shown side by side in an editor group from top to bottom.

sideBySideEditor.verticalBorder: Color to separate two editors from each other when shown side by side in an editor group from left to right.

## Editor colors 编辑器颜色

[Back to Directory 返回目录](#directory-目录)

The most prominent editor colors are the token colors used for syntax highlighting and are based on the language grammar installed. These colors are defined by the Color Theme but can also be customized with the editor.tokenColorCustomizations setting. See Customizing a Color Theme for details on updating a Color Theme and the available token types.

All other editor colors are listed here:

editor.background: Editor background color.

editor.foreground: Editor default foreground color.

editorLineNumber.foreground: Color of editor line numbers.

editorLineNumber.activeForeground: Color of the active editor line number.

editorLineNumber.dimmedForeground: Color of the final editor line when editor.renderFinalNewline is set to dimmed.

editorCursor.background: The background color of the editor cursor. Allows customizing the color of a character overlapped by a block cursor.

editorCursor.foreground: Color of the editor cursor.

editorMultiCursor.primary.foreground: Color of the primary editor cursor when multiple cursors are present.

editorMultiCursor.primary.background: The background color of the primary editor cursor when multiple cursors are present. Allows customizing the color of a character overlapped by a block cursor.

editorMultiCursor.secondary.foreground: Color of secondary editor cursors when multiple cursors are present.

editorMultiCursor.secondary.background: The background color of secondary editor cursors when multiple cursors are present. Allows customizing the color of a character overlapped by a block cursor.

editor.placeholder.foreground: Foreground color of the placeholder text in the editor.

editor.compositionBorder: The border color for an IME composition.

Selection colors are visible when selecting one or more characters. In addition to the selection also all regions with the same content are highlighted.

### selection highlight 选择区域高亮

[Back to Directory 返回目录](#directory-目录)

editor.selectionBackground: Color of the editor selection.

editor.selectionForeground: Color of the selected text for high contrast.

editor.inactiveSelectionBackground: Color of the selection in an inactive editor. The color must not be opaque so as not to hide underlying decorations.

editor.selectionHighlightBackground: Color for regions with the same content as the selection. The color must not be opaque so as not to hide underlying decorations.

editor.selectionHighlightBorder: Border color for regions with the same content as the selection.

Word highlight colors are visible when the cursor is inside a symbol or a word. Depending on the language support available for the file type, all matching references and declarations are highlighted and read and write accesses get different colors. If document symbol language support is not available, this falls back to word highlighting.

### occurrences 词语感知

[Back to Directory 返回目录](#directory-目录)

`editor.wordHighlightBackground`: Background color of a symbol during read-access, for example when reading a variable. The color must not be opaque so as not to hide underlying decorations.

当读取访问一个符号时，例如读取一个变量时，该符号的背景颜色。这个颜色必须是不透明的，以便不隐藏底层的装饰。

`editor.wordHighlightBorder`: Border color of a symbol during read-access, for example when reading a variable.

当读取访问一个符号时，例如读取一个变量时，该符号的边框颜色

`editor.wordHighlightStrongBackground`: Background color of a symbol during write-access, for example when writing to a variable. The color must not be opaque so as not to hide underlying decorations.

当写入访问一个符号时，例如写入一个变量时，该符号的背景颜色。这个颜色必须是不透明的，以便不隐藏底层的装饰。

`editor.wordHighlightStrongBorder`: Border color of a symbol during write-access, for example when writing to a variable.

当写入访问一个符号时，例如写入一个变量时，该符号的边框颜色

`editor.wordHighlightTextBackground`: Background color of a textual occurrence for a symbol. The color must not be opaque so as not to hide underlying decorations.

一个符号的文本出现处的背景颜色。该颜色必须是不透明的，以便不隐藏底层的装饰。

`editor.wordHighlightTextBorder`: Border color of a textual occurrence for a symbol.

一个符号的文本出现处的边框颜色。

Find colors depend on the current find string in the Find/Replace dialog.

查找颜色取决于(Find/Replace)对话框中当前输入的查找字符串(没有独立分组)

### Find matches 查找匹配项

[Back to Directory 返回目录](#directory-目录)

editor.findMatchBackground: Color of the current search match.

editor.findMatchForeground: Text color of the current search match.

editor.findMatchHighlightForeground: Foreground color of the other search matches.

editor.findMatchHighlightBackground: Color of the other search matches. The color must not be opaque so as not to hide underlying decorations.

editor.findRangeHighlightBackground: Color the range limiting the search (Enable 'Find in Selection' in the find widget). The color must not be opaque so as not to hide underlying decorations.

editor.findMatchBorder: Border color of the current search match.

editor.findMatchHighlightBorder: Border color of the other search matches.

editor.findRangeHighlightBorder: Border color the range limiting the search (Enable 'Find in Selection' in the find widget).

Search colors are used in the search viewlet's global search results.

### Search Results

search.resultsInfoForeground: Color of the text in the search viewlet's completion message. For example, this color is used in the text that says "{x} results in {y} files".

Search Editor colors highlight results in a Search Editor. This can be configured separately from other find matches in order to better differentiate between different classes of match in the same editor.

### Search Editor Matches

searchEditor.findMatchBackground: Color of the editor's results.

searchEditor.findMatchBorder: Border color of the editor's results.

searchEditor.textInputBorder: Search editor text input box border.

The hover highlight is shown behind the symbol for which a hover is shown.

### Hover Highlight

editor.hoverHighlightBackground: Highlight below the word for which a hover is shown. The color must not be opaque so as not to hide underlying decorations.

The current line is typically shown as either background highlight or a border (not both).

### Line Highlight

editor.lineHighlightBackground: Background color for the highlight of line at the cursor position.

editor.lineHighlightBorder: Background color for the border around the line at the cursor position.
The color for the editor watermark

editorWatermark.foreground: Foreground color for the labels in the editor watermark.
The color for unicode highlights

editorUnicodeHighlight.border: Border color used to highlight unicode characters.

editorUnicodeHighlight.background: Background color used to highlight unicode characters.

The link color is visible when clicking on a link.

### Link

editorLink.activeForeground: Color of active links.

The range highlight is visible when selecting a search result.

### Range Highlight

editor.rangeHighlightBackground: Background color of highlighted ranges, used by Quick Open, Symbol in File and Find features. The color must not be opaque so as not to hide underlying decorations.
editor.rangeHighlightBorder: Background color of the border around highlighted ranges.
The symbol highlight is visible when navigating to a symbol via a command such as Go to Definition.

editor.symbolHighlightBackground: Background color of highlighted symbol. The color must not be opaque so as not to hide underlying decorations.
editor.symbolHighlightBorder: Background color of the border around highlighted symbols.
To see the editor white spaces, enable Toggle Render Whitespace.

editorWhitespace.foreground: Color of whitespace characters in the editor.
To see the editor indent guides, set "editor.guides.indentation": true and "editor.guides.highlightActiveIndentation": true.

editorIndentGuide.background: Color of the editor indentation guides.

editorIndentGuide.background1: Color of the editor indentation guides (1).

editorIndentGuide.background2: Color of the editor indentation guides (2).

editorIndentGuide.background3: Color of the editor indentation guides (3).

editorIndentGuide.background4: Color of the editor indentation guides (4).

editorIndentGuide.background5: Color of the editor indentation guides (5).

editorIndentGuide.background6: Color of the editor indentation guides (6).

editorIndentGuide.activeBackground: Color of the active editor indentation guide.

editorIndentGuide.activeBackground1: Color of the active editor indentation guides (1).

editorIndentGuide.activeBackground2: Color of the active editor indentation guides (2).

editorIndentGuide.activeBackground3: Color of the active editor indentation guides (3).

editorIndentGuide.activeBackground4: Color of the active editor indentation guides (4).

editorIndentGuide.activeBackground5: Color of the active editor indentation guides (5).

editorIndentGuide.activeBackground6: Color of the active editor indentation guides (6).

To see the editor inline hints, set "editor.inlineSuggest.enabled": true.

editorInlayHint.background: Background color of inline hints.

editorInlayHint.foreground: Foreground color of inline hints.

editorInlayHint.typeForeground: Foreground color of inline hints for types

editorInlayHint.typeBackground: Background color of inline hints for types

editorInlayHint.parameterForeground: Foreground color of inline hints for parameters

editorInlayHint.parameterBackground: Background color of inline hints for parameters

To see editor rulers, define their location with "editor.rulers"

editorRuler.foreground: Color of the editor rulers.

editor.linkedEditingBackground: Background color when the editor is in linked editing mode.

### CodeLens

editorCodeLens.foreground: Foreground color of an editor CodeLens.

### Lightbulb

editorLightBulb.foreground: The color used for the lightbulb actions icon.
editorLightBulbAutoFix.foreground: The color used for the lightbulb auto fix actions icon.
editorLightBulbAi.foreground: The color used for the lightbulb AI icon.

### Bracket colors 括号颜色

editorBracketMatch.background: Background color behind matching brackets.
editorBracketMatch.border: Color for matching brackets boxes.

### Bracket pair colorization 括号对颜色化

editorBracketHighlight.foreground1: Foreground color of brackets (1). Requires enabling bracket pair colorization.

editorBracketHighlight.foreground2: Foreground color of brackets (2). Requires enabling bracket pair colorization.

editorBracketHighlight.foreground3: Foreground color of brackets (3). Requires enabling bracket pair colorization.

editorBracketHighlight.foreground4: Foreground color of brackets (4). Requires enabling bracket pair colorization.

editorBracketHighlight.foreground5: Foreground color of brackets (5). Requires enabling bracket pair colorization.

editorBracketHighlight.foreground6: Foreground color of brackets (6). Requires enabling bracket pair colorization.

editorBracketHighlight.unexpectedBracket.foreground: Foreground color of unexpected brackets.
Bracket pair guides:

editorBracketPairGuide.activeBackground1: Background color of active bracket pair guides (1). Requires enabling bracket pair guides.

editorBracketPairGuide.activeBackground2: Background color of active bracket pair guides (2). Requires enabling bracket pair guides.

editorBracketPairGuide.activeBackground3: Background color of active bracket pair guides (3). Requires enabling bracket pair guides.

editorBracketPairGuide.activeBackground4: Background color of active bracket pair guides (4). Requires enabling bracket pair guides.

editorBracketPairGuide.activeBackground5: Background color of active bracket pair guides (5). Requires enabling bracket pair guides.

editorBracketPairGuide.activeBackground6: Background color of active bracket pair guides (6). Requires enabling bracket pair guides.

editorBracketPairGuide.background1: Background color of inactive bracket pair guides (1). Requires enabling bracket pair guides.

editorBracketPairGuide.background2: Background color of inactive bracket pair guides (2). Requires enabling bracket pair guides.

editorBracketPairGuide.background3: Background color of inactive bracket pair guides (3). Requires enabling bracket pair guides.

editorBracketPairGuide.background4: Background color of inactive bracket pair guides (4). Requires enabling bracket pair guides.

editorBracketPairGuide.background5: Background color of inactive bracket pair guides (5). Requires enabling bracket pair guides.

editorBracketPairGuide.background6: Background color of inactive bracket pair guides (6). Requires enabling bracket pair guides.

### Folding

editor.foldBackground: Background color for folded ranges. The color must not be opaque so as not to hide underlying decorations.
editor.foldPlaceholderForeground: Color of the collapsed text after the first line of a folded range.
Overview ruler:

This ruler is located beneath the scroll bar on the right edge of the editor and gives an overview of the decorations in the editor.

editorOverviewRuler.background: Background color of the editor overview ruler. Only used when the minimap is enabled and placed on the right side of the editor.
editorOverviewRuler.border: Color of the overview ruler border.
editorOverviewRuler.findMatchForeground: Overview ruler marker color for find matches. The color must not be opaque so as not to hide underlying decorations.
editorOverviewRuler.rangeHighlightForeground: Overview ruler marker color for highlighted ranges, like by the Quick Open, Symbol in File and Find features. The color must not be opaque so as not to hide underlying decorations.
editorOverviewRuler.selectionHighlightForeground: Overview ruler marker color for selection highlights. The color must not be opaque so as not to hide underlying decorations.
editorOverviewRuler.wordHighlightForeground: Overview ruler marker color for symbol highlights. The color must not be opaque so as not to hide underlying decorations.
editorOverviewRuler.wordHighlightStrongForeground: Overview ruler marker color for write-access symbol highlights. The color must not be opaque so as not to hide underlying decorations.
editorOverviewRuler.wordHighlightTextForeground: Overview ruler marker color of a textual occurrence for a symbol. The color must not be opaque so as not to hide underlying decorations.
editorOverviewRuler.modifiedForeground: Overview ruler marker color for modified content.
editorOverviewRuler.addedForeground: Overview ruler marker color for added content.
editorOverviewRuler.deletedForeground: Overview ruler marker color for deleted content.
editorOverviewRuler.errorForeground: Overview ruler marker color for errors.
editorOverviewRuler.warningForeground: Overview ruler marker color for warnings.
editorOverviewRuler.infoForeground: Overview ruler marker color for infos.
editorOverviewRuler.bracketMatchForeground: Overview ruler marker color for matching brackets.
editorOverviewRuler.inlineChatInserted: Overview ruler marker color for inline chat inserted content.
editorOverviewRuler.inlineChatRemoved: Overview ruler marker color for inline chat removed content.

### Errors and warnings

editorError.foreground: Foreground color of error squiggles in the editor.
editorError.border: Border color of error boxes in the editor.
editorError.background: Background color of error text in the editor. The color must not be opaque so as not to hide underlying decorations.
editorWarning.foreground: Foreground color of warning squiggles in the editor.
editorWarning.border: Border color of warning boxes in the editor.
editorWarning.background: Background color of warning text in the editor. The color must not be opaque so as not to hide underlying decorations.
editorInfo.foreground: Foreground color of info squiggles in the editor.
editorInfo.border: Border color of info boxes in the editor.
editorInfo.background: Background color of info text in the editor. The color must not be opaque so as not to hide underlying decorations.
editorHint.foreground: Foreground color of hints in the editor.
editorHint.border: Border color of hint boxes in the editor.
problemsErrorIcon.foreground: The color used for the problems error icon.
problemsWarningIcon.foreground: The color used for the problems warning icon.
problemsInfoIcon.foreground: The color used for the problems info icon.
Unused source code:

editorUnnecessaryCode.border: Border color of unnecessary (unused) source code in the editor.
editorUnnecessaryCode.opacity: Opacity of unnecessary (unused) source code in the editor. For example, "#000000c0" will render the code with 75% opacity. For high contrast themes, use the "editorUnnecessaryCode.border" theme color to underline unnecessary code instead of fading it out.
The gutter contains the glyph margins and the line numbers:

editorGutter.background: Background color of the editor gutter. The gutter contains the glyph margins and the line numbers.
editorGutter.modifiedBackground: Editor gutter background color for lines that are modified.
editorGutter.addedBackground: Editor gutter background color for lines that are added.
editorGutter.deletedBackground: Editor gutter background color for lines that are deleted.
editorGutter.commentRangeForeground: Editor gutter decoration color for commenting ranges.
editorGutter.commentGlyphForeground: Editor gutter decoration color for commenting glyphs.
editorGutter.commentUnresolvedGlyphForeground: Editor gutter decoration color for commenting glyphs for unresolved comment threads.
editorGutter.foldingControlForeground: Color of the folding control in the editor gutter.
The editor comments widget can be seen when reviewing pull requests:

editorCommentsWidget.resolvedBorder: Color of borders and arrow for resolved comments.
editorCommentsWidget.unresolvedBorder: Color of borders and arrow for unresolved comments.
editorCommentsWidget.rangeBackground: Color of background for comment ranges.
editorCommentsWidget.rangeActiveBackground: Color of background for currently selected or hovered comment range.
editorCommentsWidget.replyInputBackground: Background color for comment reply input box.

## Diff editor colors

[Back to Directory 返回目录](#directory-目录)

For coloring inserted and removed text, use either a background or a border color but not both.

diffEditor.insertedTextBackground: Background color for text that got inserted. The color must not be opaque so as not to hide underlying decorations.
diffEditor.insertedTextBorder: Outline color for the text that got inserted.
diffEditor.removedTextBackground: Background color for text that got removed. The color must not be opaque so as not to hide underlying decorations.
diffEditor.removedTextBorder: Outline color for text that got removed.
diffEditor.border: Border color between the two text editors.
diffEditor.diagonalFill: Color of the diff editor's diagonal fill. The diagonal fill is used in side-by-side diff views.
diffEditor.insertedLineBackground: Background color for lines that got inserted. The color must not be opaque so as not to hide underlying decorations.
diffEditor.removedLineBackground: Background color for lines that got removed. The color must not be opaque so as not to hide underlying decorations.
diffEditorGutter.insertedLineBackground: Background color for the margin where lines got inserted.
diffEditorGutter.removedLineBackground: Background color for the margin where lines got removed.
diffEditorOverview.insertedForeground: Diff overview ruler foreground for inserted content.
diffEditorOverview.removedForeground: Diff overview ruler foreground for removed content.
diffEditor.unchangedRegionBackground: The color of unchanged blocks in diff editor.
diffEditor.unchangedRegionForeground: The foreground color of unchanged blocks in the diff editor.
diffEditor.unchangedRegionShadow: The color of the shadow around unchanged region widgets.
diffEditor.unchangedCodeBackground: The background color of unchanged code in the diff editor.
diffEditor.move.border: The border color for text that got moved in the diff editor.
diffEditor.moveActive.border: The active border color for text that got moved in the diff editor.
multiDiffEditor.headerBackground: The background color of the diff editor's header
multiDiffEditor.background: The background color of the multi file diff editor
multiDiffEditor.border: The border color of the multi file diff editor

## Chat colors

[Back to Directory 返回目录](#directory-目录)

chat.requestBorder: The border color of a chat request.
chat.requestBackground: The background color of a chat request.
chat.slashCommandBackground: The background color of a chat slash command.
chat.slashCommandForeground: The foreground color of a chat slash command.
chat.avatarBackground: The background color of a chat avatar.
chat.avatarForeground: The foreground color of a chat avatar.
chat.editedFileForeground: The foreground color of a chat edited file in the edited file list.

## Inline Chat colors

[Back to Directory 返回目录](#directory-目录)

inlineChat.background: Background color of the interactive editor widget.
inlineChat.foreground: Foreground color of the interactive editor widget
inlineChat.border: Border color of the interactive editor widget.
inlineChat.shadow: Shadow color of the interactive editor widget.
inlineChatInput.border: Border color of the interactive editor input.
inlineChatInput.focusBorder: Border color of the interactive editor input when focused.
inlineChatInput.placeholderForeground: Foreground color of the interactive editor input placeholder.
inlineChatInput.background: Background color of the interactive editor input.
inlineChatDiff.inserted: Background color of inserted text in the interactive editor input.
inlineChatDiff.removed: Background color of removed text in the interactive editor input.

## Panel Chat colors

[Back to Directory 返回目录](#directory-目录)

interactive.activeCodeBorder: The border color for the current interactive code cell when the editor has focus.
interactive.inactiveCodeBorder: The border color for the current interactive code cell when the editor does not have focus.

## Editor widget colors

[Back to Directory 返回目录](#directory-目录)

The Editor widget is shown in front of the editor content. Examples are the Find/Replace dialog, the suggestion widget, and the editor hover.

editorWidget.foreground: Foreground color of editor widgets, such as find/replace.

editorWidget.background: Background color of editor widgets, such as Find/Replace.

editorWidget.border: Border color of the editor widget unless the widget does not contain a border or defines its own border color.

editorWidget.resizeBorder: Border color of the resize bar of editor widgets. The color is only used if the widget chooses to have a resize border and if the color is not overridden by a widget.

editorSuggestWidget.background: Background color of the suggestion widget.

editorSuggestWidget.border: Border color of the suggestion widget.

editorSuggestWidget.foreground: Foreground color of the suggestion widget.

editorSuggestWidget.focusHighlightForeground: Color of the match highlights in the suggest widget when an item is focused.

editorSuggestWidget.highlightForeground: Color of the match highlights in the suggestion widget.

editorSuggestWidget.selectedBackground: Background color of the selected entry in the suggestion widget.

editorSuggestWidget.selectedForeground: Foreground color of the selected entry in the suggest widget.

editorSuggestWidget.selectedIconForeground: Icon foreground color of the selected entry in the suggest widget.

editorSuggestWidgetStatus.foreground: Foreground color of the suggest widget status.

editorHoverWidget.foreground: Foreground color of the editor hover.

editorHoverWidget.background: Background color of the editor hover.

editorHoverWidget.border: Border color of the editor hover.

editorHoverWidget.highlightForeground: Foreground color of the active item in the parameter hint.

editorHoverWidget.statusBarBackground: Background color of the editor hover status bar.

editorGhostText.border: Border color of the ghost text shown by inline completion providers and the suggest preview.

editorGhostText.background: Background color of the ghost text in the editor.

editorGhostText.foreground: Foreground color of the ghost text shown by inline completion providers and the suggest preview.

editorStickyScroll.background: Editor sticky scroll background color.

editorStickyScroll.border: Border color of sticky scroll in the editor.

editorStickyScroll.shadow: Shadow color of sticky scroll in the editor.

editorStickyScrollHover.background: Editor sticky scroll on hover background color.

The Debug Exception widget is a peek view that shows in the editor when debug stops at an exception.

debugExceptionWidget.background: Exception widget background color.
debugExceptionWidget.border: Exception widget border color.
The editor marker view shows when navigating to errors and warnings in the editor (Go to Next Error or Warning command).

editorMarkerNavigation.background: Editor marker navigation widget background.
editorMarkerNavigationError.background: Editor marker navigation widget error color.
editorMarkerNavigationWarning.background: Editor marker navigation widget warning color.
editorMarkerNavigationInfo.background: Editor marker navigation widget info color.
editorMarkerNavigationError.headerBackground: Editor marker navigation widget error heading background.
editorMarkerNavigationWarning.headerBackground: Editor marker navigation widget warning heading background.
editorMarkerNavigationInfo.headerBackground: Editor marker navigation widget info heading background.
Peek view colors
Peek views are used to show references and declarations as a view inside the editor.

## Peek view 预览视图

[Back to Directory 返回目录](#directory-目录)

peekView.border: Color of the peek view borders and arrow.
peekViewEditor.background: Background color of the peek view editor.
peekViewEditorGutter.background: Background color of the gutter in the peek view editor.
peekViewEditor.matchHighlightBackground: Match highlight color in the peek view editor.
peekViewEditor.matchHighlightBorder: Match highlight border color in the peek view editor.
peekViewResult.background: Background color of the peek view result list.
peekViewResult.fileForeground: Foreground color for file nodes in the peek view result list.
peekViewResult.lineForeground: Foreground color for line nodes in the peek view result list.
peekViewResult.matchHighlightBackground: Match highlight color in the peek view result list.
peekViewResult.selectionBackground: Background color of the selected entry in the peek view result list.
peekViewResult.selectionForeground: Foreground color of the selected entry in the peek view result list.
peekViewTitle.background: Background color of the peek view title area.
peekViewTitleDescription.foreground: Color of the peek view title info.
peekViewTitleLabel.foreground: Color of the peek view title.
peekViewEditorStickyScroll.background: Background color of sticky scroll in the peek view editor.

## Merge conflicts colors

[Back to Directory 返回目录](#directory-目录)

Merge conflict decorations are shown when the editor contains special diff ranges.

Merge ranges

merge.currentHeaderBackground: Current header background in inline merge conflicts. The color must not be opaque so as not to hide underlying decorations.
merge.currentContentBackground: Current content background in inline merge conflicts. The color must not be opaque so as not to hide underlying decorations.
merge.incomingHeaderBackground: Incoming header background in inline merge conflicts. The color must not be opaque so as not to hide underlying decorations.
merge.incomingContentBackground: Incoming content background in inline merge conflicts. The color must not be opaque so as not to hide underlying decorations.
merge.border: Border color on headers and the splitter in inline merge conflicts.
merge.commonContentBackground: Common ancestor content background in inline merge-conflicts. The color must not be opaque so as not to hide underlying decorations.
merge.commonHeaderBackground: Common ancestor header background in inline merge-conflicts. The color must not be opaque so as not to hide underlying decorations.
editorOverviewRuler.currentContentForeground: Current overview ruler foreground for inline merge conflicts.
editorOverviewRuler.incomingContentForeground: Incoming overview ruler foreground for inline merge conflicts.
editorOverviewRuler.commonContentForeground: Common ancestor overview ruler foreground for inline merge conflicts.
editorOverviewRuler.commentForeground: Editor overview ruler decoration color for resolved comments. This color should be opaque.
editorOverviewRuler.commentUnresolvedForeground: Editor overview ruler decoration color for unresolved comments. This color should be opaque.
mergeEditor.change.background: The background color for changes.
mergeEditor.change.word.background: The background color for word changes.
mergeEditor.conflict.unhandledUnfocused.border: The border color of unhandled unfocused conflicts.
mergeEditor.conflict.unhandledFocused.border: The border color of unhandled focused conflicts.
mergeEditor.conflict.handledUnfocused.border: The border color of handled unfocused conflicts.
mergeEditor.conflict.handledFocused.border: The border color of handled focused conflicts.
mergeEditor.conflict.handled.minimapOverViewRuler: The foreground color for changes in input 1.
mergeEditor.conflict.unhandled.minimapOverViewRuler: The foreground color for changes in input 1.
mergeEditor.conflictingLines.background: The background of the "Conflicting Lines" text.
mergeEditor.changeBase.background: The background color for changes in base.
mergeEditor.changeBase.word.background: The background color for word changes in base.
mergeEditor.conflict.input1.background: The background color of decorations in input 1.
mergeEditor.conflict.input2.background: The background color of decorations in input 2.

## Panel colors

[Back to Directory 返回目录](#directory-目录)

Panels are shown below the editor area and contain views like Output and Integrated Terminal.

panel.background: Panel background color.
panel.border: Panel border color to separate the panel from the editor.
panel.dropBorder: Drag and drop feedback color for the panel titles. Panels are shown below the editor area and contain views like output and integrated terminal.
panelTitle.activeBorder: Border color for the active panel title.
panelTitle.activeForeground: Title color for the active panel.
panelTitle.inactiveForeground: Title color for the inactive panel.
panelTitle.border: Panel title border color on the bottom, separating the title from the views. Panels are shown below the editor area and contain views like output and integrated terminal.
panelInput.border: Input box border for inputs in the panel.
panelSection.border: Panel section border color used when multiple views are stacked horizontally in the panel. Panels are shown below the editor area and contain views like output and integrated terminal.
panelSection.dropBackground: Drag and drop feedback color for the panel sections. The color should have transparency so that the panel sections can still shine through. Panels are shown below the editor area and contain views like output and integrated terminal.
panelSectionHeader.background: Panel section header background color. Panels are shown below the editor area and contain views like output and integrated terminal.
panelSectionHeader.foreground: Panel section header foreground color. Panels are shown below the editor area and contain views like output and integrated terminal.
panelStickyScroll.background: Background color of sticky scroll in the panel.
panelStickyScroll.border: Border color of sticky scroll in the panel.
panelStickyScroll.shadow: Shadow color of sticky scroll in the panel.
panelSectionHeader.border: Panel section header border color used when multiple views are stacked vertically in the panel. Panels are shown below the editor area and contain views like output and integrated terminal.
outputView.background: Output view background color.
outputViewStickyScroll.background: Output view sticky scroll background color.

## Status Bar colors

[Back to Directory 返回目录](#directory-目录)

The Status Bar is shown in the bottom of the workbench.

statusBar.background: Standard Status Bar background color.

statusBar.foreground: Status Bar foreground color.

statusBar.border: Status Bar border color separating the Status Bar and editor.

statusBar.debuggingBackground: Status Bar background color when a program is being debugged.

statusBar.debuggingForeground: Status Bar foreground color when a program is being debugged.

statusBar.debuggingBorder: Status Bar border color separating the Status Bar and editor when a program is being debugged.

statusBar.noFolderForeground: Status Bar foreground color when no folder is opened.

statusBar.noFolderBackground: Status Bar background color when no folder is opened.

statusBar.noFolderBorder: Status Bar border color separating the Status Bar and editor when no folder is opened.

statusBarItem.activeBackground: Status Bar item background color when clicking.

statusBarItem.hoverForeground: Status bar item foreground color when hovering. The status bar is shown in the bottom of the window.

statusBarItem.hoverBackground: Status Bar item background color when hovering.

statusBarItem.prominentForeground: Status Bar prominent items foreground color.

statusBarItem.prominentBackground: Status Bar prominent items background color.

statusBarItem.prominentHoverForeground: Status bar prominent items foreground color when hovering. Prominent items stand out from other status bar entries to indicate importance. The status bar is shown in the bottom of the window.

statusBarItem.prominentHoverBackground: Status Bar prominent items background color when hovering.
statusBarItem.remoteBackground: Background color for the remote indicator on the status bar.
statusBarItem.remoteForeground: Foreground color for the remote indicator on the status bar.
statusBarItem.remoteHoverBackground: Background color for the remote indicator on the status bar when hovering.

statusBarItem.remoteHoverForeground: Foreground color for the remote indicator on the status bar when hovering.

statusBarItem.errorBackground: Status bar error items background color. Error items stand out from other status bar entries to indicate error conditions.

statusBarItem.errorForeground: Status bar error items foreground color. Error items stand out from other status bar entries to indicate error conditions.

statusBarItem.errorHoverBackground: Status bar error items background color when hovering. Error items stand out from other status bar entries to indicate error conditions. The status bar is shown in the bottom of the window.

statusBarItem.errorHoverForeground: Status bar error items foreground color when hovering. Error items stand out from other status bar entries to indicate error conditions. The status bar is shown in the bottom of the window.

statusBarItem.warningBackground: Status bar warning items background color. Warning items stand out from other status bar entries to indicate warning conditions. The status bar is shown in the bottom of the window.

statusBarItem.warningForeground: Status bar warning items foreground color. Warning items stand out from other status bar entries to indicate warning conditions. The status bar is shown in the bottom of the window.

statusBarItem.warningHoverBackground: Status bar warning items background color when hovering. Warning items stand out from other status bar entries to indicate warning conditions. The status bar is shown in the bottom of the window.

statusBarItem.warningHoverForeground: Status bar warning items foreground color when hovering. Warning items stand out from other status bar entries to indicate warning conditions. The status bar is shown in the bottom of the window.

statusBarItem.compactHoverBackground: Status bar item background color when hovering an item that contains two hovers. The status bar is shown in the bottom of the window.

statusBarItem.focusBorder: Status bar item border color when focused on keyboard navigation. The status bar is shown in the bottom of the window.

statusBar.focusBorder: Status bar border color when focused on keyboard navigation. The status bar is shown in the bottom of the window.

statusBarItem.offlineBackground: Status bar item background color when the workbench is offline.

statusBarItem.offlineForeground: Status bar item foreground color when the workbench is offline.

statusBarItem.offlineHoverForeground: Status bar item foreground hover color when the workbench is offline.

statusBarItem.offlineHoverBackground: Status bar item background hover color when the workbench is offline.

Prominent items stand out from other Status Bar entries to indicate importance. One example is the Toggle Tab Key Moves Focus command change mode indicator.

## Title Bar colors 标题栏颜色

[Back to Directory 返回目录](#directory-目录)

`titleBar.activeBackground`: Title Bar background when the window is active.

在窗口处于活动状态时，标题栏的背景颜色

`titleBar.activeForeground`: Title Bar foreground when the window is active.

在窗口处于活动状态时，标题栏的前景颜色

`titleBar.inactiveBackground`: Title Bar background when the window is inactive.

在窗口处于不活动状态时，标题栏的背景颜色

`titleBar.inactiveForeground`: Title Bar foreground when the window is inactive.

在窗口处于不活动状态时，标题栏的前景颜色

`titleBar.border`: Title bar border color.

标题栏的边框颜色

## Menu Bar colors

[Back to Directory 返回目录](#directory-目录)

menubar.selectionForeground: Foreground color of the selected menu item in the menubar.
menubar.selectionBackground: Background color of the selected menu item in the menubar.
menubar.selectionBorder: Border color of the selected menu item in the menubar.
menu.foreground: Foreground color of menu items.
menu.background: Background color of menu items.
menu.selectionForeground: Foreground color of the selected menu item in menus.
menu.selectionBackground: Background color of the selected menu item in menus.
menu.selectionBorder: Border color of the selected menu item in menus.
menu.separatorBackground: Color of a separator menu item in menus.
menu.border: Border color of menus.

## Command Center colors

[Back to Directory 返回目录](#directory-目录)

commandCenter.foreground: Foreground color of the Command Center.

commandCenter.activeForeground: Active foreground color of the Command Center.

commandCenter.background: Background color of the Command Center.

commandCenter.activeBackground: Active background color of the Command Center.

commandCenter.border: Border color of the Command Center.

commandCenter.inactiveForeground: Foreground color of the Command Center when the window is inactive.

commandCenter.inactiveBorder: Border color of the Command Center when the window is inactive.

commandCenter.activeBorder: Active border color of the Command Center.

commandCenter.debuggingBackground: Command Center background color when a program is being debugged.

Notification colors

Notification toasts slide up from the bottom-right of the workbench.

## Notification Toasts 通知提示

[Back to Directory 返回目录](#directory-目录)

Once opened in the Notification Center, they are displayed in a list with a header:

Notification Center

notificationCenter.border: Notification Center border color.
notificationCenterHeader.foreground: Notification Center header foreground color.
notificationCenterHeader.background: Notification Center header background color.
notificationToast.border: Notification toast border color.
notifications.foreground: Notification foreground color.
notifications.background: Notification background color.
notifications.border: Notification border color separating from other notifications in the Notification Center.
notificationLink.foreground: Notification links foreground color.
notificationsErrorIcon.foreground: The color used for the notification error icon.
notificationsWarningIcon.foreground: The color used for the notification warning icon.
notificationsInfoIcon.foreground: The color used for the notification info icon.

## Banner colors 横幅颜色

[Back to Directory 返回目录](#directory-目录)

The banner appears below the title bar and spans the entire width of the workbench when visible.

横幅出现在标题栏下方，并在可见时横跨整个工作台的宽度。

banner.background: Banner background color.

banner.foreground: Banner foreground color.

banner.iconForeground: Color for the icon in front of the banner text.

## Extensions colors 扩展颜色

[Back to Directory 返回目录](#directory-目录)

extensionButton.prominentForeground: Extension view button foreground color (for example Install button).

extensionButton.prominentBackground: Extension view button background color.

extensionButton.prominentHoverBackground: Extension view button background hover color.

extensionButton.background: Button background color for extension actions.

extensionButton.foreground: Button foreground color for extension actions.

extensionButton.hoverBackground: Button background hover color for extension actions.

extensionButton.separator: Button separator color for extension actions.

extensionBadge.remoteBackground: Background color for the remote badge in the extensions view.

extensionBadge.remoteForeground: Foreground color for the remote badge in the extensions view.

extensionIcon.starForeground: The icon color for extension ratings.

extensionIcon.verifiedForeground: The icon color for extension verified publisher.

extensionIcon.preReleaseForeground: The icon color for pre-release extension.

extensionIcon.sponsorForeground: The icon color for extension sponsor.

## Quick picker colors

[Back to Directory 返回目录](#directory-目录)

pickerGroup.border: Quick picker (Quick Open) color for grouping borders.

pickerGroup.foreground: Quick picker (Quick Open) color for grouping labels.

quickInput.background: Quick input background color. The quick input widget is the container for views like the color theme picker.

quickInput.foreground: Quick input foreground color. The quick input widget is the container for views like the color theme picker.

quickInputList.focusBackground: Quick picker background color for the focused item.

quickInputList.focusForeground: Quick picker foreground color for the focused item.

quickInputList.focusIconForeground: Quick picker icon foreground color for the focused item.

quickInputTitle.background: Quick picker title background color. The quick picker widget is the container for pickers like the Command Palette.

## Keybinding label colors

[Back to Directory 返回目录](#directory-目录)

Keybinding labels are shown when there is a keybinding associated with a command. An example of the keybinding label can be seen in the Command Palette:

Keybinding label

Usages of the keybinding label include (but are not limited to):

The Command Palette
The Keyboard Shortcuts editor
The Keyboard Shortcuts recorder modal
The "feature contribution" section of an extension's marketplace page
The following customizations are available:

keybindingLabel.background: Keybinding label background color. The keybinding label is used to represent a keyboard shortcut.
keybindingLabel.foreground: Keybinding label foreground color. The keybinding label is used to represent a keyboard shortcut.
keybindingLabel.border: Keybinding label border color. The keybinding label is used to represent a keyboard shortcut.
keybindingLabel.bottomBorder: Keybinding label border bottom color. The keybinding label is used to represent a keyboard shortcut.

## Keyboard shortcut table colors

[Back to Directory 返回目录](#directory-目录)

keybindingTable.headerBackground: Background color for the keyboard shortcuts table header.
keybindingTable.rowsBackground: Background color for the keyboard shortcuts table alternating rows.

## Integrated Terminal colors

[Back to Directory 返回目录](#directory-目录)

terminal.background: The background of the Integrated Terminal's viewport.
terminal.border: The color of the border that separates split panes within the terminal. This defaults to panel.border.
terminal.foreground: The default foreground color of the Integrated Terminal.
terminal.ansiBlack: 'Black' ANSI color in the terminal.
terminal.ansiBlue: 'Blue' ANSI color in the terminal.
terminal.ansiBrightBlack: 'BrightBlack' ANSI color in the terminal.
terminal.ansiBrightBlue: 'BrightBlue' ANSI color in the terminal.
terminal.ansiBrightCyan: 'BrightCyan' ANSI color in the terminal.
terminal.ansiBrightGreen: 'BrightGreen' ANSI color in the terminal.
terminal.ansiBrightMagenta: 'BrightMagenta' ANSI color in the terminal.
terminal.ansiBrightRed: 'BrightRed' ANSI color in the terminal.
terminal.ansiBrightWhite: 'BrightWhite' ANSI color in the terminal.
terminal.ansiBrightYellow: 'BrightYellow' ANSI color in the terminal.
terminal.ansiCyan: 'Cyan' ANSI color in the terminal.
terminal.ansiGreen: 'Green' ANSI color in the terminal.
terminal.ansiMagenta: 'Magenta' ANSI color in the terminal.
terminal.ansiRed: 'Red' ANSI color in the terminal.
terminal.ansiWhite: 'White' ANSI color in the terminal.
terminal.ansiYellow: 'Yellow' ANSI color in the terminal.
terminal.selectionBackground: The selection background color of the terminal.
terminal.selectionForeground: The selection foreground color of the terminal. When this is null the selection foreground will be retained and have the minimum contrast ratio feature applied.
terminal.inactiveSelectionBackground: The selection background color of the terminal when it does not have focus.
terminal.findMatchBackground: Color of the current search match in the terminal. The color must not be opaque so as not to hide underlying terminal content.
terminal.findMatchBorder: Border color of the current search match in the terminal.
terminal.findMatchHighlightBackground: Color of the other search matches in the terminal. The color must not be opaque so as not to hide underlying terminal content.
terminal.findMatchHighlightBorder: Border color of the other search matches in the terminal.
terminal.hoverHighlightBackground: Color of the highlight when hovering a link in the terminal.
terminalCursor.background: The background color of the terminal cursor. Allows customizing the color of a character overlapped by a block cursor.
terminalCursor.foreground: The foreground color of the terminal cursor.
terminal.dropBackground: The background color when dragging on top of terminals. The color should have transparency so that the terminal contents can still shine through.
terminal.tab.activeBorder: Border on the side of the terminal tab in the panel. This defaults to tab.activeBorder.
terminalCommandDecoration.defaultBackground: The default terminal command decoration background color.
terminalCommandDecoration.successBackground: The terminal command decoration background color for successful commands.
terminalCommandDecoration.errorBackground: The terminal command decoration background color for error commands.
terminalOverviewRuler.cursorForeground: The overview ruler cursor color.
terminalOverviewRuler.findMatchForeground: Overview ruler marker color for find matches in the terminal.
terminalStickyScroll.background: The background color of the sticky scroll overlay in the terminal.
terminalStickyScroll.border: The border of the sticky scroll overlay in the terminal.
terminalStickyScrollHover.background: The background color of the sticky scroll overlay in the terminal when hovered.
terminal.initialHintForeground: Foreground color of the terminal initial hint.
terminalOverviewRuler.border: The overview ruler left-side border color.
terminalCommandGuide.foreground: The foreground color of the terminal command guide that appears to the left of a command and its output on hover.

## Debug colors

[Back to Directory 返回目录](#directory-目录)

debugToolBar.background: Debug toolbar background color.
debugToolBar.border: Debug toolbar border color.
editor.stackFrameHighlightBackground: Background color of the top stack frame highlight in the editor.
editor.focusedStackFrameHighlightBackground: Background color of the focused stack frame highlight in the editor.
editor.inlineValuesForeground: Color for the debug inline value text.
editor.inlineValuesBackground: Color for the debug inline value background.
debugView.exceptionLabelForeground: Foreground color for a label shown in the CALL STACK view when the debugger breaks on an exception.
debugView.exceptionLabelBackground: Background color for a label shown in the CALL STACK view when the debugger breaks on an exception.
debugView.stateLabelForeground: Foreground color for a label in the CALL STACK view showing the current session's or thread's state.
debugView.stateLabelBackground: Background color for a label in the CALL STACK view showing the current session's or thread's state.
debugView.valueChangedHighlight: Color used to highlight value changes in the debug views (such as in the Variables view).
debugTokenExpression.name: Foreground color for the token names shown in debug views (such as in the Variables or Watch view).
debugTokenExpression.value: Foreground color for the token values shown in debug views.
debugTokenExpression.string: Foreground color for strings in debug views.
debugTokenExpression.boolean: Foreground color for booleans in debug views.
debugTokenExpression.number: Foreground color for numbers in debug views.
debugTokenExpression.error: Foreground color for expression errors in debug views.
debugTokenExpression.type: Foreground color for the token types shown in the debug views (ie. the Variables or Watch view).

## Testing colors

[Back to Directory 返回目录](#directory-目录)

testing.runAction: Color for 'run' icons in the editor.
testing.iconErrored: Color for the 'Errored' icon in the test explorer.
testing.iconFailed: Color for the 'failed' icon in the test explorer.
testing.iconPassed: Color for the 'passed' icon in the test explorer.
testing.iconQueued: Color for the 'Queued' icon in the test explorer.
testing.iconUnset: Color for the 'Unset' icon in the test explorer.
testing.iconSkipped: Color for the 'Skipped' icon in the test explorer.
testing.iconErrored.retired: Retired color for the 'Errored' icon in the test explorer.
testing.iconFailed.retired: Retired color for the 'failed' icon in the test explorer.
testing.iconPassed.retired: Retired color for the 'passed' icon in the test explorer.
testing.iconQueued.retired: Retired color for the 'Queued' icon in the test explorer.
testing.iconUnset.retired: Retired color for the 'Unset' icon in the test explorer.
testing.iconSkipped.retired: Retired color for the 'Skipped' icon in the test explorer.
testing.peekBorder: Color of the peek view borders and arrow.
testing.peekHeaderBackground: Color of the peek view borders and arrow.
testing.message.error.lineBackground: Margin color beside error messages shown inline in the editor.
testing.message.info.decorationForeground: Text color of test info messages shown inline in the editor.
testing.message.info.lineBackground: Margin color beside info messages shown inline in the editor.
testing.messagePeekBorder: Color of the peek view borders and arrow when peeking a logged message.
testing.messagePeekHeaderBackground: Color of the peek view borders and arrow when peeking a logged message.
testing.coveredBackground: Background color of text that was covered.
testing.coveredBorder: Border color of text that was covered.
testing.coveredGutterBackground: Gutter color of regions where code was covered.
testing.uncoveredBranchBackground: Background of the widget shown for an uncovered branch.
testing.uncoveredBackground: Background color of text that was not covered.
testing.uncoveredBorder: Border color of text that was not covered.
testing.uncoveredGutterBackground: Gutter color of regions where code not covered.
testing.coverCountBadgeBackground: Background for the badge indicating execution count
testing.coverCountBadgeForeground: Foreground for the badge indicating execution count
testing.message.error.badgeBackground: Background color of test error messages shown inline in the editor.
testing.message.error.badgeBorder: Border color of test error messages shown inline in the editor.
testing.message.error.badgeForeground: Text color of test error messages shown inline in the editor.

## Welcome page colors

[Back to Directory 返回目录](#directory-目录)

welcomePage.background: Background color for the Welcome page.

welcomePage.progress.background: Foreground color for the Welcome page progress bars.

welcomePage.progress.foreground: Background color for the Welcome page progress bars.

welcomePage.tileBackground: Background color for the tiles on the Welcome page.

welcomePage.tileHoverBackground: Hover background color for the tiles on the Welcome page.

welcomePage.tileBorder: Border color for the tiles on the Welcome page.

walkThrough.embeddedEditorBackground: Background color for the embedded editors on the Interactive Playground.

walkthrough.stepTitle.foreground: Foreground color of the heading of each walkthrough step.

## Git colors

[Back to Directory 返回目录](#directory-目录)

gitDecoration.addedResourceForeground: Color for added Git resources. Used for file labels and the SCM viewlet.
gitDecoration.modifiedResourceForeground: Color for modified Git resources. Used for file labels and the SCM viewlet.
gitDecoration.deletedResourceForeground: Color for deleted Git resources. Used for file labels and the SCM viewlet.
gitDecoration.renamedResourceForeground: Color for renamed or copied Git resources. Used for file labels and the SCM viewlet.
gitDecoration.stageModifiedResourceForeground: Color for staged modifications git decorations. Used for file labels and the SCM viewlet.
gitDecoration.stageDeletedResourceForeground: Color for staged deletions git decorations. Used for file labels and the SCM viewlet.
gitDecoration.untrackedResourceForeground: Color for untracked Git resources. Used for file labels and the SCM viewlet.
gitDecoration.ignoredResourceForeground: Color for ignored Git resources. Used for file labels and the SCM viewlet.
gitDecoration.conflictingResourceForeground: Color for conflicting Git resources. Used for file labels and the SCM viewlet.
gitDecoration.submoduleResourceForeground: Color for submodule resources.
git.blame.editorDecorationForeground: Color for the blame editor decoration.

## Source Control Graph colors

[Back to Directory 返回目录](#directory-目录)

scmGraph.historyItemHoverLabelForeground: History item hover label foreground color.
scmGraph.foreground1: Source control graph foreground color (1).
scmGraph.foreground2: Source control graph foreground color (2).
scmGraph.foreground3: Source control graph foreground color (3).
scmGraph.foreground4: Source control graph foreground color (4).
scmGraph.foreground5: Source control graph foreground color (5).
scmGraph.historyItemHoverAdditionsForeground: History item hover additions foreground color.
scmGraph.historyItemHoverDeletionsForeground: History item hover deletions foreground color.
scmGraph.historyItemRefColor: History item reference color.
scmGraph.historyItemRemoteRefColor: History item remote reference color.
scmGraph.historyItemBaseRefColor: History item base reference color.
scmGraph.historyItemHoverDefaultLabelForeground: History item hover default label foreground color.
scmGraph.historyItemHoverDefaultLabelBackground: History item hover default label background color.

## Settings Editor colors

[Back to Directory 返回目录](#directory-目录)

Note: These colors are for the GUI settings editor which can be opened with the Preferences: Open Settings (UI) command.

settings.headerForeground: The foreground color for a section header or active title.
settings.modifiedItemIndicator: The line that indicates a modified setting.
settings.dropdownBackground: Dropdown background.
settings.dropdownForeground: Dropdown foreground.
settings.dropdownBorder: Dropdown border.
settings.dropdownListBorder: Dropdown list border.
settings.checkboxBackground: Checkbox background.
settings.checkboxForeground: Checkbox foreground.
settings.checkboxBorder: Checkbox border.
settings.rowHoverBackground: The background color of a settings row when hovered.
settings.textInputBackground: Text input box background.
settings.textInputForeground: Text input box foreground.
settings.textInputBorder: Text input box border.
settings.numberInputBackground: Number input box background.
settings.numberInputForeground: Number input box foreground.
settings.numberInputBorder: Number input box border.
settings.focusedRowBackground: Background color of a focused setting row.
settings.focusedRowBorder: The color of the row's top and bottom border when the row is focused.
settings.headerBorder: The color of the header container border.
settings.sashBorder: The color of the Settings editor splitview sash border.
settings.settingsHeaderHoverForeground: The foreground color for a section header or hovered title.

## Breadcrumbs colors

[Back to Directory 返回目录](#directory-目录)

The theme colors for breadcrumbs navigation:

breadcrumb.foreground: Color of breadcrumb items.
breadcrumb.background: Background color of breadcrumb items.
breadcrumb.focusForeground: Color of focused breadcrumb items.
breadcrumb.activeSelectionForeground: Color of selected breadcrumb items.
breadcrumbPicker.background: Background color of breadcrumb item picker.

## Snippets colors

[Back to Directory 返回目录](#directory-目录)

The theme colors for snippets:

editor.snippetTabstopHighlightBackground: Highlight background color of a snippet tabstop.
editor.snippetTabstopHighlightBorder: Highlight border color of a snippet tabstop.
editor.snippetFinalTabstopHighlightBackground: Highlight background color of the final tabstop of a snippet.
editor.snippetFinalTabstopHighlightBorder: Highlight border color of the final tabstop of a snippet.

## Symbol Icons colors

[Back to Directory 返回目录](#directory-目录)

The theme colors for symbol icons that appears in the Outline view, breadcrumb navigation, and suggest widget:

symbolIcon.arrayForeground: The foreground color for array symbols.
symbolIcon.booleanForeground: The foreground color for boolean symbols.
symbolIcon.classForeground: The foreground color for class symbols.
symbolIcon.colorForeground: The foreground color for color symbols.
symbolIcon.constantForeground: The foreground color for constant symbols.
symbolIcon.constructorForeground: The foreground color for constructor symbols.
symbolIcon.enumeratorForeground: The foreground color for enumerator symbols.
symbolIcon.enumeratorMemberForeground: The foreground color for enumerator member symbols.
symbolIcon.eventForeground: The foreground color for event symbols.
symbolIcon.fieldForeground: The foreground color for field symbols.
symbolIcon.fileForeground: The foreground color for file symbols.
symbolIcon.folderForeground: The foreground color for folder symbols.
symbolIcon.functionForeground: The foreground color for function symbols.
symbolIcon.interfaceForeground: The foreground color for interface symbols.
symbolIcon.keyForeground: The foreground color for key symbols.
symbolIcon.keywordForeground: The foreground color for keyword symbols.
symbolIcon.methodForeground: The foreground color for method symbols.
symbolIcon.moduleForeground: The foreground color for module symbols.
symbolIcon.namespaceForeground: The foreground color for namespace symbols.
symbolIcon.nullForeground: The foreground color for null symbols.
symbolIcon.numberForeground: The foreground color for number symbols.
symbolIcon.objectForeground: The foreground color for object symbols.
symbolIcon.operatorForeground: The foreground color for operator symbols.
symbolIcon.packageForeground: The foreground color for package symbols.
symbolIcon.propertyForeground: The foreground color for property symbols.
symbolIcon.referenceForeground: The foreground color for reference symbols.
symbolIcon.snippetForeground: The foreground color for snippet symbols.
symbolIcon.stringForeground: The foreground color for string symbols.
symbolIcon.structForeground: The foreground color for struct symbols.
symbolIcon.textForeground: The foreground color for text symbols.
symbolIcon.typeParameterForeground: The foreground color for type parameter symbols.
symbolIcon.unitForeground: The foreground color for unit symbols.
symbolIcon.variableForeground: The foreground color for variable symbols.

## Debug Icons colors

[Back to Directory 返回目录](#directory-目录)

debugIcon.breakpointForeground: Icon color for breakpoints.

debugIcon.breakpointDisabledForeground: Icon color for disabled breakpoints.

debugIcon.breakpointUnverifiedForeground: Icon color for unverified breakpoints.

debugIcon.breakpointCurrentStackframeForeground: Icon color for the current breakpoint stack frame.

debugIcon.breakpointStackframeForeground: Icon color for all breakpoint stack frames.

debugIcon.startForeground: Debug toolbar icon for start debugging.

debugIcon.pauseForeground: Debug toolbar icon for pause.

debugIcon.stopForeground: Debug toolbar icon for stop.

debugIcon.disconnectForeground: Debug toolbar icon for disconnect.

debugIcon.restartForeground: Debug toolbar icon for restart.

debugIcon.stepOverForeground: Debug toolbar icon for step over.

debugIcon.stepIntoForeground: Debug toolbar icon for step into.

debugIcon.stepOutForeground: Debug toolbar icon for step over.

debugIcon.continueForeground: Debug toolbar icon for continue.

debugIcon.stepBackForeground: Debug toolbar icon for step back.

debugConsole.infoForeground: Foreground color for info messages in debug REPL console.

debugConsole.warningForeground: Foreground color for warning messages in debug REPL console.

debugConsole.errorForeground: Foreground color for error messages in debug REPL console.

debugConsole.sourceForeground: Foreground color for source filenames in debug REPL console.

debugConsoleInputIcon.foreground: Foreground color for debug console input marker icon.

## Notebook colors

[Back to Directory 返回目录](#directory-目录)

notebook.editorBackground: Notebook background color.
notebook.cellBorderColor: The border color for notebook cells.
notebook.cellHoverBackground: The background color of a cell when the cell is hovered.
notebook.cellInsertionIndicator: The color of the notebook cell insertion indicator.
notebook.cellStatusBarItemHoverBackground: The background color of notebook cell status bar items.
notebook.cellToolbarSeparator: The color of the separator in the cell bottom toolbar
notebook.cellEditorBackground: The color of the notebook cell editor background
notebook.focusedCellBackground: The background color of a cell when the cell is focused.
notebook.focusedCellBorder: The color of the cell's focus indicator borders when the cell is focused.
notebook.focusedEditorBorder: The color of the notebook cell editor border.
notebook.inactiveFocusedCellBorder: The color of the cell's top and bottom border when a cell is focused while the primary focus is outside of the editor.
notebook.inactiveSelectedCellBorder: The color of the cell's borders when multiple cells are selected.
notebook.outputContainerBackgroundColor: The Color of the notebook output container background.
notebook.outputContainerBorderColor: The border color of the notebook output container.
notebook.selectedCellBackground: The background color of a cell when the cell is selected.
notebook.selectedCellBorder: The color of the cell's top and bottom border when the cell is selected but not focused.
notebook.symbolHighlightBackground: Background color of highlighted cell
notebookScrollbarSlider.activeBackground: Notebook scrollbar slider background color when clicked on.
notebookScrollbarSlider.background: Notebook scrollbar slider background color.
notebookScrollbarSlider.hoverBackground: Notebook scrollbar slider background color when hovering.
notebookStatusErrorIcon.foreground: The error icon color of notebook cells in the cell status bar.
notebookStatusRunningIcon.foreground: The running icon color of notebook cells in the cell status bar.
notebookStatusSuccessIcon.foreground: The success icon color of notebook cells in the cell status bar.
notebookEditorOverviewRuler.runningCellForeground: The color of the running cell decoration in the notebook editor overview ruler.

## Chart colors

[Back to Directory 返回目录](#directory-目录)

charts.foreground: Contrast color for text in charts.
charts.lines: Color for lines in charts.
charts.red: Color for red elements in charts.
charts.blue: Color for blue elements in charts.
charts.yellow: Color for yellow elements in charts.
charts.orange: Color for orange elements in charts.
charts.green: Color for green elements in charts.
charts.purple: Color for purple elements in charts.
chart.line: Line color for the chart.
chart.axis: Axis color for the chart.
chart.guide: Guide line for the chart.

## Ports Colors

[Back to Directory 返回目录](#directory-目录)

ports.iconRunningProcessForeground: The color of the icon for a port that has an associated running process.

## Comments View colors

[Back to Directory 返回目录](#directory-目录)

commentsView.resolvedIcon: Icon color for resolved comments.
commentsView.unresolvedIcon: Icon color for unresolved comments.

## Action Bar colors

[Back to Directory 返回目录](#directory-目录)

actionBar.toggledBackground: Background color for toggled action items in action bar.

## Simple Find Widget

[Back to Directory 返回目录](#directory-目录)

simpleFindWidget.sashBorder: Border color of the sash border.

## Extension colors

[Back to Directory 返回目录](#directory-目录)

Color IDs can also be contributed by extensions through the color contribution point. These colors also appear when using code complete in the workbench.colorCustomizations settings and the color theme definition file. Users can see what colors an extension defines in the extension contributions tab.
