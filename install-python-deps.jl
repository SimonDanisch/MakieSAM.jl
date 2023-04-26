# TODO, how to install them with CondaPkg? I run into one problem after the other and then gave up

# using PyCall
# run(`$(PyCall.python) -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu117`)
# run(`$(PyCall.python) -m pip install git+https://github.com/facebookresearch/segment-anything.git`)
# run(`$(PyCall.python) -m pip install opencv-python`)

using CondaPkg
for p in ["pytorch", "torchvision"]
    CondaPkg.add(p, channel="pytorch")
end
CondaPkg.add("opencv")
CondaPkg.add_pip("segment-anything", version="@git+https://github.com/facebookresearch/segment-anything.git")
using PythonCall
using Downloads
# Download model
Downloads.download("https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth", joinpath(@__DIR__, "sam_vit_h_4b8939.pth"))
