# _Children's Word Definer, in Ruby and Sinatra_

#### _Using Ruby and the Sinatra Framework, create a web application that allows children to define words_

#### By _Robert Lee_

## Description

_Create a website application that allows children to write a list of words they don't know and allows them to store their own definitions.  The additional objective is to design the user experience for children the best you can._

## Setup/Installation Requirements

* Clone this repository using `git clone https://github.com/bobbydwise1/anagrams_antigrams.git`
* Navigate to the downloaded repository using a terminal window.
* Your computer must have Ruby installed.  In the terminal window at the working directory of the program, you will need to install some addtional Ruby Gems files.  Do this by putting this on the command line while connected to the internet:
  "$ bundle install
* To run the test cases, type at the terminal: $ rspec
*

## Technologies Used

_Ruby, Sinatra framework, Atom, , HTML, Git._

## Behaviors

* Note the user is considered to be a child.  Make the UI as kid friendly as possible.

* There is a homepage that contains a list of words.

* When a word is clicked, it will lead to a page with the word's definition.

* Children should be able to add more words to the main list of words, and provide their own definitions.

* (Optional):  Deploy the web application to the web app hosting site, Heroku.

## Specifications

* The application must contain a Word Class.  Note that there is no backend database for this assignment.  In order to store information, a class variable will be used.

* The Word Class must be able to store list of words (with persistence), with one definition.
  * Input:  word1 = Word.new("dog", "A string that defines dog per Webster")
            word1.add
            Word.all()
  * Output:  [["dog", "A string that defines dog per Webster."]]

* The Word Class must be able to add to the list of words.
  * Input:  word1 = Word.new("dog", "A string that defines dog per Webster")
            word1.add
            word2 = Word.new("cat", "A string that defines cat per Webster")
            word2.add
  * Output: [
              ["dog", "A string that defines dog per Webster."],
              ["cat", "A string that defines cat per Webster."],
            ]

* The ability to add more than one definition to a word.  Note this implies a find method and push method for the list.
  * Input:  (previous example from above)
            word2.add("cat", "My custom definition of a cat")
  * Output: [
              ["dog", "A string that defines dog per Webster."],
              ["cat", "A string that defines cat per Webster.", "My custom definition of a cat"],
            ]

* The ability to find all word definitions based on a search term from the user.
  * Input: (previous example from above)
            Word.find_def("cat")
  * Ouptut:  ["A string that defines cat per Webster.", "My custom definition of a cat"]

## Known bugs

* Type any known bugs here

### License

MIT License

Copyright (c) 2018, _Robert Lee_

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
