// This file was automatically generated from template.soy.
// Please don't edit this file by hand.

/**
 * @fileoverview Templates in namespace Pond.soy.
 */

goog.provide('Pond.soy');

goog.require('soy');
goog.require('soydata');
goog.require('BlocklyGames.soy');


Pond.soy.messages = function(opt_data, opt_ignored, opt_ijData) {
  return BlocklyGames.soy.messages(null, null, opt_ijData) + '<div style="display: none"><span id="Pond_scanTooltip">搜索敌人。指定搜索的方向(0-360)，函数会返回在此方向上最近的一个敌人的距离。如果在此方向上没有搜索到敌人，那么返回Infinity。</span><span id="Pond_cannonTooltip">开炮。指定发射方向 (0-360) 以及发射距离 (0-70)。</span><span id="Pond_swimTooltip">向前游动。指定游动方向 (0-360)。</span><span id="Pond_stopTooltip">停止游动。你的小鸭子会缓缓停下来。</span><span id="Pond_healthTooltip">获取你的小鸭子此刻的生命值 (0 表示小鸭子挂了, 100 表示生命值是满的)。</span><span id="Pond_speedTooltip">获取小鸭子现在的游动速度 (0 表示正停在原地, 100 表示正以最高速前进)。</span><span id="Pond_locXTooltip">获取小鸭子此刻的 X 坐标 (0 表示在左侧边缘, 100 表示在右侧边缘)。</span><span id="Pond_locYTooltip">获取小鸭子此刻的 Y 坐标 (0 表示在下侧边缘, 100 表示在上侧边缘)。</span></div>';
};
if (goog.DEBUG) {
  Pond.soy.messages.soyTemplateName = 'Pond.soy.messages';
}


Pond.soy.visualization = function(opt_data, opt_ignored, opt_ijData) {
  return '<div id="visualization"><canvas id="scratch" width="400" height="400" style="display: none"></canvas><canvas id="display" width="400" height="400"></canvas></div><table id="avatarStatTable"><tbody><tr id="avatarStatRow"></tr></tbody></table><table width="400"><tr><td style="width: 240px; text-align: center; vertical-align: top;"><button id="docsButton" title="查看脚本帮助文档">查看帮助</button></td><td><button id="runButton" class="primary" title="开始执行你的战斗脚本。"><img src="/common/1x1.gif" class="run icon21">开始战斗</button><button id="resetButton" class="primary" style="display: none" title="中止脚本运行，重置战场为初始状态。"><img src="/common/1x1.gif" class="stop icon21">结束战斗</button></td></tr></table><div id="dialogDocs"><img src="/common/1x1.gif" class="close icon21" id="closeDocs"><iframe id="frameDocs"></iframe></div>';
};
if (goog.DEBUG) {
  Pond.soy.visualization.soyTemplateName = 'Pond.soy.visualization';
}
