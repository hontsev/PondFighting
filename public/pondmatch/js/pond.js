/**
 * Blockly Games: Pond
 *
 * Copyright 2013 Google Inc.
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
 * @fileoverview Creates an pond for avatars to compete in.
 * @author fraser@google.com (Neil Fraser)
 */
'use strict';

goog.provide('Pond');

goog.require('BlocklyGames');
goog.require('Pond.Battle');
goog.require('Pond.Visualization');
goog.require('goog.math.Coordinate');


/**
 * Optional callback function for when a game ends.
 * @type function(number)
 */
Pond.endBattle = null;

/**
 * Initialize the pond.  Called on page load.
 */
Pond.init = function() {
  BlocklyInterface.init();
  Pond.Visualization.init();


  // Lazy-load the JavaScript interpreter.
  setTimeout(BlocklyInterface.importInterpreter, 1);
  // Lazy-load the syntax-highlighting.
  setTimeout(BlocklyInterface.importPrettify, 1);
};


/**
 * Execute the users' code.  Heaven help us...
 */
Pond.execute = function() {
  if (!('Interpreter' in window)) {
    // Interpreter lazy loads and hasn't arrived yet.  Try again later.
    setTimeout(Pond.execute, 250);
    return;
  }
  Pond.reset();

  Pond.Battle.start(Pond.endBattle);
  Pond.Visualization.start();
};

/**
 * Reset the pond and kill any pending tasks.
 */
Pond.reset = function() {
  Pond.Battle.reset();
  Pond.Visualization.reset();
};

