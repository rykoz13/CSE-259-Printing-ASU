/*
Group Members: 

Emily Barkley ASU ID: 1221599665

and 

Ryan Kozak ASU ID: 1214829096
*/

drawSymbol(Symbol, 0).
drawSymbol(Symbol, N) :- N > 0, write(Symbol), N1 is N - 1, drawSymbol(Symbol, N1).


drawHorizontalLine(Symbol, 0) :- nl.
drawHorizontalLine(Symbol, N) :- drawSymbol(Symbol, N).


drawVerticalLinesWithSpace(Symbol, 0, Width).
drawVerticalLinesWithSpace(Symbol, Height, Width) :- 
  Height > 0,
  write(Symbol),
  drawSymbol(' ', Width - 2),
  write(Symbol),
  nl,
  Height1 is Height - 1,
  drawVerticalLinesWithSpace(Symbol, Height1, Width).


/*-------------------------------------------------------------------------------------------------*/
/* draw A */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  ColumnNumber >= TextWidth.

/* 
 * Covers the left-most and the right-most columns that only have stars 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (
    (ColumnNumber >= 0, ColumnNumber < FontSize);
    (ColumnNumber >= FontSize * 2, ColumnNumber < TextWidth )
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


/* 
 * Covers the middle segment
 * Will have either stars or spaces 
 */
drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= FontSize * 2 , CurrentLine < FontSize * 3)
  ),
  drawSymbol('*', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= FontSize, CurrentLine < 2 * FontSize);
    (CurrentLine >= FontSize * 3, CurrentLine < TextHeight)
  ),
  drawSymbol(' ', FontSize),
  NextColumn is ColumnNumber + FontSize,
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).
/* draw A */
/*-------------------------------------------------------------------------------------------------*/


/*-------------------------------------------------------------------------------------------------*/
/* draw S */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
    ColumnNumber >= TextWidth.

/* Rule 1
 * Covers the left segment
 * Will have either stars or spaces 
 */

/* segment where stars are needed */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= 0, ColumnNumber < FontSize),
  (
    (CurrentLine >= 0, CurrentLine < FontSize * 3);
    (CurrentLine >= FontSize * 4 , CurrentLine < TextHeight)
  ),
  drawSymbol('*', FontSize),      % draw stars 
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* segment where spaces are needed */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= 0, ColumnNumber < FontSize),
  (
    (CurrentLine >= FontSize * 3, CurrentLine < FontSize * 4)
  ),
  drawSymbol(' ', FontSize),      % draw spaces
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


/* Rule 2
 * Covers the middle segment
 * Will have either stars or spaces 
 */

/* segment where stars are needed */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= FontSize * 2 , CurrentLine < FontSize * 3);
    (CurrentLine >= FontSize * 4, CurrentLine < TextHeight)
  ),
  drawSymbol('*', FontSize),      % draw stars
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* segment where spaces are needed */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
  (
    (CurrentLine >= FontSize, CurrentLine < 2 * FontSize);
    (CurrentLine >= FontSize * 3, CurrentLine < 4 * FontSize)
  ),
  drawSymbol(' ', FontSize),      % draw spaces                                 
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* Rule 3
 * Covers the right most segment
 * Will have either stars or spaces 
 */

/* segment where stars are needed */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize * 2, ColumnNumber < FontSize * 3),
  (
    (CurrentLine >= 0, CurrentLine < FontSize);
    (CurrentLine >= FontSize * 2 , CurrentLine < TextHeight)
  ),
  drawSymbol('*', FontSize),      % draw stars
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* segment where spaces are needed */
drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
  (ColumnNumber >= FontSize * 2, ColumnNumber < FontSize * 3),
  (
    (CurrentLine >= FontSize, CurrentLine < 2 * FontSize)
  ),
  drawSymbol(' ', FontSize),      % draw spaces
  NextColumn is ColumnNumber + FontSize,
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* draw S */
/*-------------------------------------------------------------------------------------------------*/


/*-------------------------------------------------------------------------------------------------*/
/* draw U */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
    ColumnNumber >= TextWidth.

/* Rule 1 
 * Left-most and Right-most segments 
 * Will have only stars
 */

/* segment where stars are needed */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
    (
        (ColumnNumber >= 0, ColumnNumber < FontSize);
        (ColumnNumber >= TextWidth - FontSize, ColumnNumber < TextWidth)
    ),
    drawSymbol('*', FontSize),      % draw stars
    NextColumn is ColumnNumber + FontSize,
    drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* Rule 2
 * Covers the middle segment
 * Will have either stars or spaces 
 */

/* segment where stars are needed */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
    (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
    (
        (CurrentLine >= FontSize * 4, CurrentLine < FontSize * 5)
    ),
    drawSymbol('*', FontSize),      % draw stars
    NextColumn is ColumnNumber + FontSize,
    drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).

/* segment where spaces are needed */
drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber) :-
    (ColumnNumber >= FontSize, ColumnNumber < FontSize * 2),
    (
        (CurrentLine >= 0, CurrentLine < FontSize * 4)
    ),
    drawSymbol(' ', FontSize),      % draw spaces
    NextColumn is ColumnNumber + FontSize,
    drawU(TextWidth, TextHeight, FontSize, CurrentLine, NextColumn).


/* draw U */
/*-------------------------------------------------------------------------------------------------*/

/*-------------------------------------------------------------------------------------------------*/
/* draw the text with appropriate spacing*/
draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight) :-
  CurrentLine >= TextHeight.
draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight) :-
  CurrentLine < TextHeight,
  ColumnNumber is 0,
  write('|'), drawSymbol(' ', LeftRightMargin),
  drawA(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  
  /*---------------------------------------------*/
  /** WRITE YOUR CODE HERE **/
  /* Spacing between A and S */
  drawSymbol(' ', SpaceBetweenCharacters),

  /* Make column 0 before starting new letter */
  ColumnNumber is 0,
  
  /* Call drawS */
  drawS(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  
  /* Spacing between S and U */
  drawSymbol(' ', SpaceBetweenCharacters),

  /* Make column 0 before starting new letter */
  ColumnNumber is 0,
  
  /* Call drawU */
  drawU(TextWidth, TextHeight, FontSize, CurrentLine, ColumnNumber),
  /*---------------------------------------------*/

  drawSymbol(' ', LeftRightMargin),
  write('|'),
  nl,
  NextLine is CurrentLine + 1,
  draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, NextLine, TextWidth, TextHeight).
/*-------------------------------------------------------------------------------------------------*/


/* this will be initiating the variables and will be called from asu() */
drawVerticalLinesWithCharacters(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
  CurrentLine is 0,
  TextWidth is FontSize * 3,
  TextHeight is FontSize * 5,
  draw(LeftRightMargin, SpaceBetweenCharacters, FontSize, CurrentLine, TextWidth, TextHeight).


/* this will be used from the console */
asu(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize) :-
  /* verify that the variables are integers */
  integer(LeftRightMargin), integer(BottomTopMargin), integer(SpaceBetweenCharacters), integer(FontSize),

  /* calculate the height and width */
  Width is (LeftRightMargin * 2 + SpaceBetweenCharacters * 2 + FontSize * 3 * 3 + 2),
  Height is (BottomTopMargin * 2 + FontSize * 5),

  /* top horizontal line of the box */
  drawHorizontalLine('-', Width),
  nl,

  /* the empty space in the top */
  drawVerticalLinesWithSpace('|', BottomTopMargin, Width),

  /* the actual text */
  drawVerticalLinesWithCharacters(LeftRightMargin, BottomTopMargin, SpaceBetweenCharacters, FontSize),

  /* the empty space in the bottom */
  drawVerticalLinesWithSpace('|', BottomTopMargin, Width),

  /* bottom horizontal line of the box */
  drawHorizontalLine('-', Width).