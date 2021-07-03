function onload() {
  return new Promise(function(resolve, reject) {
    if (document.readyState === 'complete') {
      return resolve();
    }
    window.addEventListener('load', resolve);
  })
}

function toggleHidden(el) {
  if (el.hidden) {
    el.hidden = false;
  } else {
    el.hidden = true;
  }
}


export { onload, toggleHidden };
