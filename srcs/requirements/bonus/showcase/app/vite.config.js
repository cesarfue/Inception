import { defineConfig } from 'vite'
import fs from 'fs'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
    resolve: { alias: { '@': '/src' } },
    plugins: [vue()],
    server: {
        host: '0.0.0.0',
        port: 40000,
        https: {
          key: fs.readFileSync('/etc/vite/ssl/private.key'),
          cert: fs.readFileSync('/etc/vite/ssl/bundle.crt'),
        }
    }
})
