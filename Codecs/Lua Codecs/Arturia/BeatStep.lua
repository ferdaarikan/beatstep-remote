
--- Surface:	BeatStep
--- Developer:	AFA
--- Version:	1.0

--- Copyright (c) 2024 AFA

-- CC (dec)	10	74	71	76	77	93	73	75
-- CC(hex)	A	4A	47	4C	4D	5D	49	4B
								
-- CC (dec)	114	18	19	16	17	91	79	72
-- CC(hex)	72	12	13	10	11	5B	4F	48

-- 0A	
-- 4A	cut
-- 47	reso
-- 4C	lforate
-- 4D	lfoamt
-- 5D	chorus
-- 49	atk1
-- 4B	dec1

-- 72	preset
-- 12	param1
-- 13	param2
-- 10	param3
-- 11	param4
-- 5B	delay
-- 4F	sus1
-- 48	rel1
 
function remote_init(manufacturer, model)
	local items = {

		-- index 1
		{name="record", input="button", output="value"},
		{name="stop", input="button", output="value"},
		{name="play", input="button", output="value",  modes={"Play", "Pause"}}, 
		{name="loop", input="button", output="value"},
		{name="rew", input="button", output="value"},
		{name="fwd", input="button", output="value"},
		{name="taptempo", input="button", output="value"},
		{name="metro", input="button", output="value"},
		{name="switch", input="button", output="value"},
		{name="channel", input="delta"},
		{name="preset", input="delta"},
		{name="songPos", input="delta"},

		{name="click", input="button"},
		{name="quant", input="button"},
		
		{name="volume", input="value", min=0, max=127},
		{name="drive", input="value", min=0, max=127},
		{name="cut", input="value", min=0, max=127},
		{name="reso", input="value", min=0, max=127},
		{name="lforate", input="delta"},
		{name="lfoamt", input="delta"},
		{name="chorus", input="delta"},
		{name="atk1", input="value", min=0, max=127},
		{name="dec1", input="value", min=0, max=127},

		-- index 13
		{name="fader1", input="value", output="value", min=0, max=127},
		{name="fader2", input="value", output="value", min=0, max=127},
		{name="fader3", input="value", output="value", min=0, max=127},
		{name="fader4", input="value", output="value", min=0, max=127},
		
		{name="param1", input="delta"},
		{name="param2", input="delta"},
		{name="param3", input="delta"},
		{name="param4", input="delta"},
		{name="delay", input="delta"},
		{name="sus1", input="delta"},
		{name="rel1", input="delta"},	

		{name="encoder1", input="value", output="value", min=0, max=127},
		{name="encoder2", input="value", output="value", min=0, max=127},
		{name="encoder3", input="value", output="value", min=0, max=127},
		{name="encoder4", input="value", output="value", min=0, max=127},
		{name="encoder5", input="value", output="value", min=0, max=127},
		{name="encoder6", input="value", output="value", min=0, max=127},
		{name="encoder7", input="value", output="value", min=0, max=127},
		{name="encoder8", input="value", output="value", min=0, max=127},

		-- index 25
		{name="lcd-1", output="text"},
		{name="lcd-2", output="text"},
		{name="tempo", output="value", min=1, max=999},
		{name="bar", output="text"},
		{name="beat", output="text"},


		{name="Keyboard", input="keyboard"},
		{name="Pitch Bend", input="value", min=0, max=16384},
		{name="Mod Wheel", input="value", min=0, max=127},
		{name="Damper Pedal", input="value", min=0, max=127},


	}
	remote.define_items(items)

	local inputs = {
		{pattern="e? xx yy", name="Pitch Bend", value="y*128 + x"},
		{pattern="b0 01 xx", name="Mod Wheel"},
		{pattern="b0 40 xx", name="Damper Pedal"},
		{pattern="<100x>? yy zz", name="Keyboard"},

		{pattern="b0 16 xx", name="click", value="1"},
		{pattern="b0 17 xx", name="quant", value="1"},
		
		{pattern="F0 7F 7F 06 01 F7", name="stop", value="1"},
		{pattern="F0 7F 7F 06 02 F7", name="play", value="1"},
		{pattern="F0 7F 7F 06 05 F7", name="rew", value="1"},
		{pattern="F0 7F 7F 06 04 F7", name="fwd", value="1"},
		{pattern="b0 1D xx", name="loop", value="1"},
		{pattern="b0 1C xx", name="record", value="1"},

		--Beatstep knobs
		{pattern="b0 07 xx", name="volume", value="x"},

		{pattern="b0 0A xx", name="drive", value="x"},
		{pattern="b0 4A xx", name="cut", value="x"},
		{pattern="b0 47 xx", name="reso", value="x"},
		{pattern="b0 4C xx", name="lforate", value="(64 - x) * -1"},
		{pattern="b0 4D xx", name="lfoamt", value="x"},
		{pattern="b0 5D xx", name="chorus", value="(64 - x) * -1"},
		{pattern="b0 49 xx", name="atk1", value="x"},
		{pattern="b0 4B xx", name="dec1", value="x"},

		{pattern="b0 72 xx", name="preset", value="(64 - x) * -1"},
		{pattern="b0 12 xx", name="param1", value="(64 - x) * -1"},
		{pattern="b0 13 xx", name="param2", value="(64 - x) * -1"},
		{pattern="b0 10 xx", name="param3", value="(64 - x) * -1"},
		{pattern="b0 11 xx", name="param4", value="(64 - x) * -1"},
		{pattern="b0 5B xx", name="delay", value="(64 - x) * -1"},
		{pattern="b0 4F xx", name="sus1", value="(64 - x) * -1"},
		{pattern="b0 48 xx", name="rel1", value="(64 - x) * -1"},
		-- end beatstep knobs 

		{pattern="b? 0e xx", name="fader1", value="x"},
		{pattern="b? 0f xx", name="fader2", value="x"},
		{pattern="b? 1e xx", name="fader3", value="x"},
		{pattern="b? 1f xx", name="fader4", value="x"},

		{pattern="b? 56 xx", name="encoder1", value="x"},
		{pattern="b? 57 xx", name="encoder2", value="x"},
		{pattern="b? 59 xx", name="encoder3", value="x"},
		{pattern="b? 5a xx", name="encoder4", value="x"},
		{pattern="b? 6e xx", name="encoder5", value="x"},
		{pattern="b? 6f xx", name="encoder6", value="x"},
		{pattern="b? 74 xx", name="encoder7", value="x"},
		{pattern="b? 75 xx", name="encoder8", value="x"},

		{pattern="b? 1d <?x??>?", name="songPos"},		

	}
	remote.define_auto_inputs(inputs)

	--Auto outputs
	local outputs = {
		{name="record", pattern="F0 00 20 6B 7F 42 02 02 16 5A xF 00 00 F7", x = "value*7"},
		{name="play", pattern="F0 00 20 6B 7F 42 02 02 16 59 00 xF 00 F7", x = "value*7"},
		{name="stop", pattern="F0 00 20 6B 7F 42 02 02 16 58 xF yF zF F7", x = "value*7", y = "value*7", z = "value*7"},
		{name="taptempo", pattern="F0 00 20 6B 7F 42 02 02 16 5B xF yF zF F7", x = "value*7", y = "value*7", z = "value*7"},
		{name="loop", pattern="F0 00 20 6B 7F 42 02 02 16 57 xF yF 00 F7", x = "value*7", y = "value*7"},
	
	}
	remote.define_auto_outputs(outputs)
end

----------------------------
---- Remote Auto-Detect ----
----------------------------

function remote_probe(manufacturer,model,prober)


	assert(model == "BeatStep")
	local controlRequest="F0 7E 7F 06 01 F7"
	local controlResponse="f0 7e 00 06 02 00 20 6b 02 00 06 00 03 00 02 01 f7"
	return {
		request=controlRequest,
		response=controlResponse
	}


end