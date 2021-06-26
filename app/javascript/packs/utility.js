export function onload() {
  return new Promise(function(resolve, reject) {
    if (document.readyState === 'complete') {
      return resolve();
    }
    window.addEventListener('load', resolve);
  })
}
