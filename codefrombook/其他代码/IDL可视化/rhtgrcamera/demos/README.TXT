
This directory contains a few simple programs that demonstrate the use of
my RHTgrCamera object.


camdemo_basic - This program simply shows how to set up a basic view using
                RHTgrCamera.

camdemo_pan - This program demonstrates panning the camera and intoduces the
              use of multiple views to layer informaiton on the window.

camdemo_lookat - This program demonstrates using the LOOKAT method and the
                 use of the TRACK keyword.

camdemo_examine - This program serves as an example of using the THIRD_PERSON
                  keyword to simulate a trackball like effect.

camdemo_cullnfly - This program is a catch all.  It demonstrates using the
                   camera to "fly" thru a scene navigting by keyboard and
                   mouse.  It also demonstrates the use of the FORCE_AR
                   keyword and view frustum culling.

                   * This demo requires a strong processor and very good *
                   * graphics hardware.  On weaker systems it will not   *
                   * process events properly and keyboard and mouse input*
                   * will be lost.                                       *


Also included in this directory is a modified version of the "orb" object
included with IDL.  This modified version differes from the stock RSI version
in that the SetProperty method only calls orb::buildPoly when required.  This
change mkes the orb suitible for use in animation or as a test object for
view frustum culling.  The camdemo_cullnfly program REQUIRES the modified orb.


