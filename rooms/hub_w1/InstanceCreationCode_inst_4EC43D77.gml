targetRoom = molasses_1;
targetDoor = "A";
level = "molasses";
details = [gate_createlayer(spr_molasses_startgate, 0), gate_createlayer(spr_molasses_startgate, 1), gate_createlayer(spr_molasses_startgate, 2, 1), gate_createlayer(spr_molasses_startgate, 3, 0.75), gate_createlayer(spr_molasses_startgate, 4, 0.5), gate_createlayer(spr_molasses_startgate, 5, 0.25)];
info = 
{
    bginfo: [spr_molassescard_bg, (2 << 0), (4 << 0), (8 << 0), 0, 0],
    titleinfo: [spr_molassescard_title, (0 << 0), (5 << 0), (6 << 0), 0, 0],
    song: mu_swamp_title
};
