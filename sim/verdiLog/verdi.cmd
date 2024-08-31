verdiSetActWin -dock widgetDock_<Decl._Tree>
simSetSimulator "-vcssv" -exec \
           "/home1/BPRN08/VegiJ/VLSI_RN/UVM_LABS/UVM_Verification_Projects/counter_verification_uvm/sim/simv" \
           -args "-a vcs.log +ntb_random_seed_automatic"
debImport "-dbdir" \
          "/home1/BPRN08/VegiJ/VLSI_RN/UVM_LABS/UVM_Verification_Projects/counter_verification_uvm/sim/simv.daidir"
debLoadSimResult \
           /home1/BPRN08/VegiJ/VLSI_RN/UVM_LABS/UVM_Verification_Projects/counter_verification_uvm/sim/wave.fsdb
wvCreateWindow
verdiWindowResize -win $_Verdi_1 "485" "31" "1370" "749"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
srcHBSelect "top.DUV" -win $_nTrace1
verdiSetActWin -dock widgetDock_<Inst._Tree>
srcHBAddObjectToWave -clipboard
wvDrop -win $_nWave2
verdiSetActWin -win $_nWave2
verdiDockWidgetMaximize -dock windowDock_nWave_2
wvSelectSignal -win $_nWave2 {( "DUV" 1 2 3 4 5 6 )} 
wvSelectSignal -win $_nWave2 {( "DUV" 3 )} 
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 55855.148936 -snap {("G3" 0)}
wvSetCursor -win $_nWave2 10615.744681 -snap {("in0(counter_if)" 3)}
wvSetCursor -win $_nWave2 31520.595745 -snap {("in0(counter_if)" 6)}
wvSetCursor -win $_nWave2 30050.723404 -snap {("in0(counter_if)" 5)}
wvSetCursor -win $_nWave2 31520.595745 -snap {("in0(counter_if)" 3)}
wvSetCursor -win $_nWave2 11758.978723 -snap {("in0(counter_if)" 2)}
wvSetCursor -win $_nWave2 11105.702128 -snap {("in0(counter_if)" 3)}
wvSetCursor -win $_nWave2 50138.978723 -snap {("DUV" 6)}
wvSetCursor -win $_nWave2 31357.276596 -snap {("DUV" 4)}
wvSetCursor -win $_nWave2 50302.297872 -snap {("DUV" 5)}
wvSetCursor -win $_nWave2 50302.297872 -snap {("DUV" 5)}
wvSetCursor -win $_nWave2 49975.659574 -snap {("DUV" 6)}
wvSetCursor -win $_nWave2 10289.106383 -snap {("in0(counter_if)" 2)}
wvSetCursor -win $_nWave2 10779.063830 -snap {("in0(counter_if)" 3)}
wvSetCursor -win $_nWave2 69737.276596 -snap {("DUV" 4)}
wvSetCursor -win $_nWave2 50628.936170 -snap {("DUV" 6)}
wvSetCursor -win $_nWave2 50465.617021 -snap {("DUV" 6)}
wvSetCursor -win $_nWave2 50628.936170 -snap {("in0(counter_if)" 5)}
wvSetCursor -win $_nWave2 50628.936170 -snap {("in0(counter_if)" 4)}
wvSetCursor -win $_nWave2 70227.234043 -snap {("in0(counter_if)" 6)}
wvSetCursor -win $_nWave2 31520.595745 -snap {("in0(counter_if)" 4)}
wvSetCursor -win $_nWave2 50138.978723 -snap {("DUV" 6)}
wvSetCursor -win $_nWave2 31030.638298 -snap {("DUV" 4)}
wvSelectSignal -win $_nWave2 {( "DUV" 2 )} 
wvSetCursor -win $_nWave2 11432.340426 -snap {("DUV" 3)}
wvSetCursor -win $_nWave2 31030.638298 -snap {("DUV" 3)}
debExit
