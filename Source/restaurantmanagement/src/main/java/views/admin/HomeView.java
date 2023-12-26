package views.admin;

import utils.RandomColor;


public class HomeView extends javax.swing.JPanel {

    private boolean isShowLed = false;

    public static void setTimeout(Runnable runnable, int delay) {
        new Thread(() -> {
            try {
                Thread.sleep(delay);
                runnable.run();
            } catch (Exception e) {
                System.err.println(e);
            }
        }).start();
    }

    public HomeView() {
        initComponents();

    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        labLogo = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(153, 255, 255));
        setMaximumSize(new java.awt.Dimension(1008, 680));
        setMinimumSize(new java.awt.Dimension(1008, 680));
        addMouseListener(new java.awt.event.MouseAdapter() {
            public void mousePressed(java.awt.event.MouseEvent evt) {
                formMousePressed(evt);
            }
        });
        setLayout(null);

        labLogo.setPreferredSize(new java.awt.Dimension(400, 400));
        add(labLogo);
        labLogo.setBounds(810, 10, 200, 190);

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 24)); // NOI18N
        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/HomeView.jpg"))); // NOI18N
        jLabel1.setToolTipText("");
        jLabel1.setVerticalAlignment(javax.swing.SwingConstants.BOTTOM);
        jLabel1.setMaximumSize(new java.awt.Dimension(10080000, 68000000));
        add(jLabel1);
        jLabel1.setBounds(0, 0, 1000, 1000);
    }// </editor-fold>//GEN-END:initComponents

    private void formMousePressed(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_formMousePressed
        isShowLed = !isShowLed;
        makeLed();
    }//GEN-LAST:event_formMousePressed

    private void makeLed() {
        if (!isShowLed) {
            return;
        }
        setBackground(RandomColor.getColor());
        jLabel1.setForeground(RandomColor.getContrastColor(getBackground()));
        setTimeout(this::makeLed, 200);
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel labLogo;
    // End of variables declaration//GEN-END:variables
}
