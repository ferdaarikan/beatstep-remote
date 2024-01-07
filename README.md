# beatstep-remote
Contains Reason remote codec and mapping for Arturia BeatStep midi controller. 

BeatStep is a device full of features but I was frustrated that there was no built-in support for the hardware in Reason. BeatStep can be used as a sequencer, midi controller using 16 infinite knobs and 16 touch sensitive drum pads to play instruments.
It was a disappointment to not being able to fully utilise the BeatStep. I derived the files in this repository from two of the built-in Arturia mappings. I removed a lot of the existing lua code and functions which didn't seem useful for the BeatStep. 

### Currenty supported functions (```CNTRL``` mode)
- ```Start``` and ```Play``` buttons can control Reason
- ```Volume``` knob controls the Master Volume
- All the knobs can be mapped to Reason
- Default knob mappings are listed below.

I tried to keep the Arturia naming for knobs as much as I can though I am open to any new naming suggestions. Currently knobs are named as below. Probably you won't see those names unless you are experimenting with the ```.remotemap``` file.

