import * as THREE from 'three';

var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);

camera.position.z = 5;

var renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

var geometry = new THREE.TorusKnotGeometry(1, 0.4, 64, 8);

var material = new THREE.MeshBasicMaterial({color: 0x800080}); // Purple color

var torusKnot = new THREE.Mesh(geometry, material);

scene.add(torusKnot);

function animate() {
  requestAnimationFrame(animate);

  torusKnot.rotation.x += 0.01;
  torusKnot.rotation.y += 0.01;

  renderer.render(scene, camera);
}

animate();

