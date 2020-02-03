# Printed parts
---

### Printer:

Since the system needs to be watertight and the internal volumes of the chamber should be quite small (higher volumes would require more solution to be flushed through and some of the compounds are quite expensive), we chose a resin printer. The department has a form2 printer from [FormLabs](https://formlabs.com/).

---

### Printing considerations

- Given the small internal volume of the microfluidic chambers, and the viscosity of the resin, the parts to be printed are oriented in such a way that the an "exit hole" is facing down, so that the excess resin from inside the chambers is being pulled out by gravity while the part is being printed.

- Once the main parted is printed, the inlets and outlets are plugged in sequence, so that at any time there are only two open. This way we can flush the system with isopropyl alcohol with a syringe and dissolve/push out the remaining resin that is inside the system. this should be done quickly and trying to avoid light as the resin cures when exposed to it.

- After flushing the system, the part should be cleaned and curated as described by the printer manufacturer.
---

### Files:

The parts are designed using [OpenScad](openscad.org). Files are exported as `.stl` files:

- `ychannel_test.stl` is a small part to test printer characteristics, from printing it users will be able to know if the internal chambers are big enough, and if the luer and micromanipulator fittings are to the correct size.

- `ychannel_less_material.stl` is a complete chamber, but the sides of the block are removed to decrease the amount of resin used. Ths thinner sides can also have holes drilled (or designed into before printing) so that the whole block can be fixed somewhere with screws.

- `ychannel.stl` is a complete chamber with regular sides.

- `ychannel.scad` is the OpenScad files where users can change the part parameters and adapt it to their needs. More explanations on the model itself and how to change it, is on the `.scad` file
