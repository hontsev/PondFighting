/**
 * Blockly Games: Pond Database
 *
 * Copyright 2014 Google Inc.
 * https://github.com/google/blockly-games
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @fileoverview Creates a multi-user pond (duck page).
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Pond.Duck');

goog.require('BlocklyDialogs');
goog.require('BlocklyGames');
goog.require('BlocklyInterface');
goog.require('Pond');
goog.require('Pond.Battle');
goog.require('Pond.Blocks');
goog.require('Pond.Duck.soy');
goog.require('Pond.Visualization');
goog.require('goog.events');
goog.require('goog.ui.Tab');
goog.require('goog.ui.TabBar');


BlocklyGames.NAME = 'pond-duck';

/**
 * Is the blocks editor the program source (true) or is the JS editor
 * the program source (false).
 * @private
 */
Pond.Duck.blocksEnabled_ = true;

/**
 * ACE editor fires change events even on programatically caused changes.
 * This property is used to signal times when a programatic change is made.
 */
Pond.Duck.ignoreEditorChanges_ = true;

/**
 * Initialize Ace and the pond.  Called on page load.
 */
Pond.Duck.init = function() {
  // Render the Soy template.
  document.getElementById('pond_game_content').innerHTML = Pond.Duck.soy.start({}, null,
      {lang: BlocklyGames.LANG,
       html: BlocklyGames.IS_HTML});

  Pond.init();
	initMatch();

  //var rtl = BlocklyGames.isRtl();
  //var visualization = document.getElementById('visualization');
  //var tabDiv = document.getElementById('tabarea');
  //var blocklyDiv = document.getElementById('blockly');
  //var editorDiv = document.getElementById('editor');
  //var divs = [blocklyDiv, editorDiv];

  // // Inject JS editor.
  // var defaultCode = 'cannon(100, 70);';
  // BlocklyInterface.editor['setValue'](defaultCode, -1);


  Pond.reset();
  Pond.Duck.ignoreEditorChanges_ = true;
  
  
};


window.addEventListener('load', Pond.Duck.init);
