import java.awt.*;
import java.awt.event.*;

public class AWTExample extends Frame implements ActionListener {

    Button btnA, btnB;
    Label label;

    AWTExample() {

        setLayout(new FlowLayout());

        btnA = new Button("A");
        btnB = new Button("B");
        label = new Label("Click a button");

        add(btnA);
        add(btnB);
        add(label);

        btnA.addActionListener(this);
        btnB.addActionListener(this);

        setSize(400, 200);
        setVisible(true);

        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                dispose();
            }
        });
    }

    public void actionPerformed(ActionEvent e) {

        if(e.getSource() == btnA) {
            label.setText("Name: Pooja | Course: MSc CS | Roll No: 123456789 | College: MIT WPU");
        }
        else if(e.getSource() == btnB) {
            label.setText("Previous Semester CGPA: 8.9");
        }
    }

    public static void main(String[] args) {
        new AWTExample();
    }
}
