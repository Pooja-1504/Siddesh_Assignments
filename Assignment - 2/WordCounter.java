import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class WordCounter extends JFrame implements ActionListener {

    JTextArea textArea;
    JButton countButton;
    JLabel resultLabel;

    WordCounter() {

        setTitle("Word & Character Counter");
        setLayout(new FlowLayout());

        textArea = new JTextArea(5, 30);
        countButton = new JButton("Count");
        resultLabel = new JLabel("Words: 0 | Characters: 0");

        add(new JScrollPane(textArea));
        add(countButton);
        add(resultLabel);

        countButton.addActionListener(this);

        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setVisible(true);
    }

    public void actionPerformed(ActionEvent e) {

        String text = textArea.getText();

        // Count characters (including spaces)
        int characters = text.length();

        // Count words
        String trimmedText = text.trim();
        int words = 0;

        if (!trimmedText.isEmpty()) {
            String[] wordArray = trimmedText.split("\\s+");
            words = wordArray.length;
        }

        resultLabel.setText("Words: " + words + " | Characters: " + characters);
    }

    public static void main(String[] args) {
        new WordCounter();
    }
}
