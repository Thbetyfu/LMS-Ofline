const { app, BrowserWindow, shell } = require('electron');
const path = require('path');
const { spawn } = require('child_process');

let mainWindow;

function createWindow() {
    mainWindow = new BrowserWindow({
        width: 1280,
        height: 800,
        title: 'CourseLit Desktop',
        icon: path.join(__dirname, 'icon.png'), // Opsional
        webPreferences: {
            nodeIntegration: false,
            contextIsolation: true
        }
    });

    // Sembunyikan menu bar agar terlihat seperti native app
    mainWindow.setMenuBarVisibility(false);

    // Load web app student
    mainWindow.loadURL('http://localhost:3002');

    // Handle external links (open in default browser app)
    mainWindow.webContents.setWindowOpenHandler(({ url }) => {
        shell.openExternal(url);
        return { action: 'deny' };
    });
}

app.whenReady().then(() => {
    // Jalankan START-COURSELIT.bat di background jika belum jalan
    // (Opsional, tapi sebaiknya user menjalankan batch file utama dulu)
    
    // Tunggu sebentar agar server siap (jika dijalankan bersamaan)
    setTimeout(createWindow, 3000); 

    app.on('activate', () => {
        if (BrowserWindow.getAllWindows().length === 0) createWindow();
    });
});

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') app.quit();
});
