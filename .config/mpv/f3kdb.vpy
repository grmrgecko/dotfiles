import vapoursynth as vs
core = vs.get_core()

#core.std.LoadPlugin("/usr/local/lib/libf3kdb.so")

clip = video_in
clip = core.f3kdb.Deband(clip, grainy=0, grainc=0, output_depth=16)

clip.set_output()
