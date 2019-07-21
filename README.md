# Hypercube Extruders
Direct drive and Bowden swappable extruders for the Hypercube design of printer.

Also available on thingiverse: http://www.thingiverse.com/thing:3761366

![Image of both toolheads](/img/both-front.jpg "Image of both toolheads")

### Background
These extruders take a lot of their design inspiration from the [original hypercube
design by Tech2C](https://www.thingiverse.com/thing:1752766). In particular the bowden
extruder is very similar and credit for that original design should go to Tech2C. The
Direct drive extruder is loosely modelled on the PrusaMk3 extruder but with a completely
redesigned idler design.

### Motivations
Both the Bowden and Direct extruders are designed to be swappable on the hypercube, and to
fit within the build volume of a stock designed hypecube without having to move any of the
other parts to make it functional. In particular, working out how to enclose the stepper
motor and blower fans for the Direct Drive extruder was the most tricky. The latter allows
the Hypercube design of printer to print flexible filaments like TPU.

Both extruders use the same print head mounting as Tech2C designed for the orignal hypercube
and are designed to fit to a normal hypercube X-carriage.

Neither of the extruders include an inductive Z probe. They are designed for an AnyCubic
Ultrabase bed (Glass), and so use a Z endstop rather than a probe. Anyone wishing to add a
Z probe mount to the designs, pull requests will be considered, or people are welcome to
duplicate and edit these designs on Thingiverse of fork this repository on Github. Please
link back to this repository or the designs on Github, I'd love to help people find the right
extruder for them.

## Design and Assembly
_All the CAD work is in OpenSCAD to enable people to edit the designs themselves if they like._

Given that these components will be near *heat*, I strongly recomment printing in PETG rather
than PLA. All of these parts have been printed at .2mm layer heights and have worked fine.
Some post processing/cleanup on holes may be required.

The OpenSCAD files also depend on the chamfered primitives library: https://www.thingiverse.com/thing:1305888

### Bowden

This is really just the hotend, you'll need your own extruder. I use the compact bowden extruder
from the original hypercube.

![Image of bowden on the printer](/img/bowden.jpg "Image of bowden on the printer")

Components:
- Printed
  - 1x `bowden-toolhead`.
    _NB: This toolhead has an integrated duct, rather than the seperate ducting piece required
    for the original hypercube design. This makes assembly simpler and also makes the design
    lighter._
  - 1x `bowden-clamp-40mm`
  - (optional) 1x 40mm Fan Grille
    from [mightynozzle on Thingiverse](http://www.thingiverse.com/thing:2802474)
- Non Printed
  - 1x E3D V6 hotend (bowden configuration)
  - 4x M3 nyloc nuts (for mounting to the x-carriage)
  - 4x M3 full nuts
    - 2x for mounting the blower fan
    - 2x for attaching the clamp
  - 4x M3x20 Socket Head screws
    - 2x for mounting the blower fan
    - 2x for mounting the clamp
  - 1x Blower fan (same as for Hypercube)
  - 1x 40mm Case Fan (Designed around a Scythe Mini `SY124020L`) which is _really_ quiet, but any
    40mm fan up to 20mm deep fan should work.
  - 4x No4 (2.9mm dia) x 32mm (1 1/4") self tapping screws (to mount the 40mm fan)
  - 2x 2.5mm cable ties
  - (optional) Cable braiding and heatshrink to taste.
  - (optional) 1x MPX M6 connectors (if using these to make the extruders
    swappable as recommended by Tech2C)

### Direct Drive

![Image of direct version on the printer from the left](/img/direct-left.jpg)

![Image of direct version on the printer from the right](/img/direct-right.jpg)

Components:
- Printed
  - 1x `direct-toolhead`
  - 1x `direct-duct`
  - 1x `direct-clamp`
  - 1x `direct-idler-arm`
  - 1x `bowden-clamp-40mm`
  - (optional) 1x 30mm Fan Grille
    from [mightynozzle on Thingiverse](http://www.thingiverse.com/thing:2802474)
- Non Printed
  - 1x E3D V6 hotend (direct configuration). *Ideally also drill out the end, to insert
    some PTFE tubing directly down the throad*. A PTFE insert is also helpful.
  - 1x NEMA17 20mm deep stepper motor. This is less deep than the usual NEMA17 stepper
    motors but we need a lower profile one so that we don't hit the frame of the hypercube.
  - 1x 625 bearing
  - 1x M5x10 bolt for holding the bearing (I use half round head, but other style may also
    work).
  - 4x M3 nyloc nuts (for mounting to the x-carriage)
  - 5x M3 full nuts
    - 2x for mounting the blower fan
    - 2x for attaching the clamp
    - 1x for the tensioner arm bolt
  - 6x M3x20 Socket Head screws
    - 2x for mounting the blower fan
    - 2x for mounting the clamp
    - 2x for the stepper motor (one of which is also the axle for the idler arm).
  - 2x M3x10 Socket Head screws (for the other two mounting points for the stepper motor).
  - 1x M3x30 Socket Head screw for the tensioning arm.
  - 1x The spring from a biro, to go around the M3x30 bolt.
  - 1x Blower fan (same as for Hypercube)
  - 1x 30mm Fan, no more than 10mm deep
  - 5x No4 (2.9mm dia) x 19mm (3/4") self tapping screws
    - 4x to mount the 30mm fan
    - 1x to mount the duct to the base
  - 4x 2.5mm cable ties
  - (optional) Cable braiding and heatshrink to taste.
  - (optional) 2x MPX M6 connectors (if using these to make the extruders
    swappable as recommended by Tech2C)
    - One for the same configuration as the bowden setup, one for a
      line to the stepper motor

### Mounting Point (2020 extrusion)

If you've got two print heads, it's useful to have somewhere to put the ones you're not using. This is a simple solution to that problem.

![Image of mount](/img/mount.jpg)

![Image of mounted extruders](/img/mounted-extruders.jpg)

Components:
- Printed
  - 1x `mount`
- Non Printed
  - 1x M5x8 bolt
  - 1x M5 T-nut
  - 2x M3 full nuts
  - 2x M3x10 Socket Head screws
