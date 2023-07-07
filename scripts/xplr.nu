# TODO: experimental ZSH interaction layer for fm-nvim:
def "xplr >" [name path] {
  xplr |save -f $name| $path
}

def xplrGetSelectionFileDirOrDir [] {
  let resultpath = (xplr)
  if (($resultpath | path type) == 'dir') {
    echo $resultpath
  } else {
    let resultpathDir = ($resultpath | path dirname)
    echo $resultpathDir
  }
}
