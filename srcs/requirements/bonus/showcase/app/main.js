import * as THREE from 'three';
import { ImprovedNoise } from 'three/examples/jsm/math/ImprovedNoise.js';

// Create scene, camera, and renderer
var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
camera.position.z = 100;
var renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

// Generate Perlin noise
var perlin = new ImprovedNoise();
var size = 100;
var data = new Float32Array(size * size * 3); // 3 coordinates per point
for (var i = 0; i < size * size; i++) {
    var x = i % size / size * 5;
    var y = Math.floor(i / size) / size * 5;
    data[i * 3] = x * 100 - 50; // x coordinate
    data[i * 3 + 1] = (perlin.noise(x, y, 0) * 0.5 + 0.5) * 30; // y coordinate (height)
    data[i * 3 + 2] = y * 100 - 50; // z coordinate
}

// Create geometry
var geometry = new THREE.BufferGeometry();
geometry.setAttribute('position', new THREE.BufferAttribute(data, 3));

// Create material
var material = new THREE.MeshBasicMaterial({color: 0x886633, wireframe: true});

// Create terrain
var terrain = new THREE.Mesh(geometry, material);
scene.add(terrain);

// Render
function animate() {
    requestAnimationFrame(animate);
    renderer.render(scene, camera);
}
animate();
