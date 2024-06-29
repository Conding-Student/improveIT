extends TextureRect

# A dictionary to store references to the UI elements.
onready var controls = {
	"add": $Control2/add_code,
	"code1": $Control2/add_code/code1,
	"dprocess1": $Control2/add_code/displaying_process,
	"output1": $Control2/add_code/output,
	"code2": $Control2/add_code/code2,
	"dprocess2": $Control2/add_code/displaying_process2,
	"outpu2": $Control2/add_code/output2,
	"AddRange": $Control2/add_range, #addrange
	"arcode1": $Control2/add_range/code3,
	"ardp1": $Control2/add_range/displaying_process3,
	"aroutput1": $Control2/add_range/output,
	"binarysearch": $Control2/binary_search,
	"bscode1": $Control2/binary_search/code3,
	"bsdp1": $Control2/binary_search/displaying_process3,
	"clear": $Control2/clear,
	"ccode": $Control2/clear/code3,
	"cdp": $Control2/clear/displaying_process3,
	"contains": $Control2/contains
}

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initially hide the 'add' section.
	controls["add"].visible = false
	controls["AddRange"].visible = false
	#get_parent()
	#hide()

# Called when the 'close' button is pressed.
func _on_close_pressed():
	# Hide the current node.
	hide()

# Show the 'add' section when 'Add' is pressed.
func _on_Add_pressed():
	controls["add"].visible = true
	controls["AddRange"].visible = false
	controls["binarysearch"].visible = false
	controls["clear"].visible = false
	controls["contains"].visible = false

# Helper function to set visibility of the elements.
# It takes booleans for each element to show or hide them.
func _update_visibility(visible_code1, visible_dprocess1, visible_output1, visible_code2, visible_dprocess2, visible_outpu2):
	controls["code1"].visible = visible_code1
	controls["dprocess1"].visible = visible_dprocess1
	controls["output1"].visible = visible_output1
	controls["code2"].visible = visible_code2
	controls["dprocess2"].visible = visible_dprocess2
	controls["outpu2"].visible = visible_outpu2

# Button press handlers to show or hide elements based on the button pressed.

func _on_AddMCode1_next_pressed():
	# Hide code1, show dprocess1, hide all other elements.
	_update_visibility(false, true, false, false, false, false)

func _on_AddMDprocess_previous_pressed():
	# Show code1, hide dprocess1, hide all other elements.
	_update_visibility(true, false, false, false, false, false)

func _on_AddMDprocess_next_pressed():
	# Hide code1 and dprocess1, show output1, hide all other elements.
	_update_visibility(false, false, true, false, false, false)

func _on_AddMOutput_previous_pressed():
	# Hide output1, show dprocess1, hide all other elements.
	_update_visibility(false, true, false, false, false, false)

func _on_AddMOutput_next_pressed():
	# Hide code1, dprocess1, and output1, show code2, hide all other elements.
	_update_visibility(false, false, false, true, false, false)

func _on_AddMCode2_previous_pressed():
	# Hide code2, show output1, hide all other elements.
	_update_visibility(false, false, true, false, false, false)

func _on_AddMCode2_next_pressed():
	# Hide all elements, show dprocess2.
	_update_visibility(false, false, false, false, true, false)

func _on_AddMDprocess2_previous_pressed():
	# Hide dprocess2, show code2, hide all other elements.
	_update_visibility(false, false, false, true, false, false)

func _on_AddMDprocess2_next_pressed():
	# Hide all elements, show outpu2.
	_update_visibility(false, false, false, false, false, true)

func _on_AddMOutput2_previous_pressed():
	# Hide outpu2, show dprocess2, hide all other elements.
	_update_visibility(false, false, false, false, true, false)

# add range
func _on_Add_Range_pressed():
	controls["add"].visible = false
	controls["AddRange"].visible = true
	controls["binarysearch"].visible = false
	controls["clear"].visible = false
	controls["contains"].visible = false


func _on_Addrange_code1_previous_pressed():
	controls["arcode1"].visible = false
	controls["ardp1"].visible = true
	controls["aroutput1"].visible = false


func _on_Addrange_dp1_previous_pressed():
	controls["arcode1"].visible = true
	controls["ardp1"].visible = false
	controls["aroutput1"].visible = false

func _on_Addrange_dp1_next_pressed():
	controls["arcode1"].visible = false
	controls["ardp1"].visible = false
	controls["aroutput1"].visible = true

func _on_Addrange_output1_previous_pressed():
	controls["arcode1"].visible = false
	controls["ardp1"].visible = true
	controls["aroutput1"].visible = false
# end of add range

# binary search
func _on_Binary_Search_pressed():
	controls["AddRange"].visible = false
	controls["add"].visible = false
	controls["binarysearch"].visible = true
	controls["clear"].visible = false
	controls["contains"].visible = false


func _on_binarysearch_code1_next_pressed():
	controls["bscode1"].visible = false
	controls["bsdp1"].visible = true


func _on_binarysearch_dp1_previous_pressed():
	controls["bscode1"].visible = true
	controls["bsdp1"].visible = false
# end of binary search

# Clear
func _on_Clear_pressed():
	controls["AddRange"].visible = false
	controls["add"].visible = false
	controls["binarysearch"].visible = false
	controls["clear"].visible = true
	controls["contains"].visible = false

func _on_clear_code_next_pressed():
	controls["ccode"].visible = false
	controls["cdp"].visible = true


func _on_clear_dp_previous_pressed():
	controls["ccode"].visible = true
	controls["cdp"].visible = false
# End Clear

#contains
func _on_Contains_pressed():
	controls["AddRange"].visible = false
	controls["add"].visible = false
	controls["binarysearch"].visible = false
	controls["clear"].visible = false
	controls["contains"].visible = true
