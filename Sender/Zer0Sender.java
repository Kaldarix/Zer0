import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;

public class Zer0Sender {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Usage: java Zer0Sender <IP> <COMMAND>");
            return;
        }

        String ip = args[0];
        String command = args[1];

        try (Socket socket = new Socket(ip, 6666);
             OutputStream os = socket.getOutputStream();
             PrintWriter writer = new PrintWriter(os, true)) {

            writer.println(command);
            System.out.println("[Zer0Sender] Command sent to " + ip);

        } catch (Exception e) {
            System.err.println("[Zer0Sender] Error: " + e.getMessage());
        }
    }
}
