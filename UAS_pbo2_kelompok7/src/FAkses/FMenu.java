/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FAkses;

import com.formdev.flatlaf.FlatLaf;
import com.formdev.flatlaf.FlatLightLaf;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.JPanel;
import javax.swing.Timer;

/**
 *
 * @author PC
 */
public class FMenu extends javax.swing.JFrame {

    String status;
    int count;

    /**
     * Creates new form FMenu
     */
    public FMenu() {

        jLabel4 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();

        // Pengaturan properti dan tampilan JLabel jLabel4
        initComponents();

        execute();

        ImageIcon backgroundImage = new ImageIcon(getClass().getResource("/img/sidebar.png"));
        Image image = backgroundImage.getImage();

        JPanel jPanel1 = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                g.drawImage(image, 0, 0, getWidth(), getHeight(), this);
            }
        };

        menus.add(jPanel1);

//        hakakses();
//        levellogin();
        tampil2();
        tampil();
        tampilstock();
    }

    public void tampilstock() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_uas_pbo2", "root", "")) {
            String sql = "SELECT stock FROM tb_data_alat";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                count++;

            }

            if (count > 0) {
                String countText = String.valueOf(count);
                stock.setText(countText);

            } else {
//                jLabel6.setText("TIDAK ADA PERIZINAN!!!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void tampil2() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_uas_pbo2", "root", "")) {
            String sql = "SELECT * FROM user";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                count++;

            }

            if (count > 0) {
                String countText = String.valueOf(count);
                user.setText(countText + " USER");

            } else {
//                jLabel6.setText("TIDAK ADA PERIZINAN!!!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void tampil() {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_uas_pbo2", "root", "")) {
            String sql = "SELECT * FROM tb_pengelolaan WHERE status = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, "belum_diizinkan");
            ResultSet rs = stmt.executeQuery();

            int count = 0; // Menginisialisasi count dengan 0

            while (rs.next()) {
                String status = rs.getString("status");

                if (status.equalsIgnoreCase("belum_diizinkan")) {
                    count++;
                }
            }

            if (count > 0) {
                String countText = String.valueOf(count);
                jLabel4.setText(countText);
                jLabel9.setText("PENGAMBILAN DATA ALAT ");
                jLabel10.setText("MEMERLUKAN " + countText + " PERIZINAN!!");

                Timer blinkTimer = new Timer(500, new ActionListener() {
                    private boolean isVisible = true;

                    @Override
                    public void actionPerformed(ActionEvent e) {
                        isVisible = !isVisible;
                        jLabel4.setVisible(isVisible);
                        jLabel4.revalidate();
                        jLabel4.repaint();

                        jLabel9.setVisible(isVisible);
                        jLabel9.revalidate();
                        jLabel9.repaint();

                        jLabel10.setVisible(isVisible);
                        jLabel10.revalidate();
                        jLabel10.repaint();
                    }
                });
                blinkTimer.start();
            } else {
                // jLabel6.setText("TIDAK ADA PERIZINAN!!!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//
//    private void levellogin() {
//        String upperCaseText = SESSION.SessionLevel.getSessionLevel().toUpperCase();
//        jLabel2.setText(upperCaseText);
//
//    }
//    private void hakakses() {
//        String status = SESSION.SessionLevel.getSessionLevel();
//
//        if (status.equals("Admin")) {
////            jLabel6.setForeground(new java.awt.Color(204, 0, 0));
//            tampil();
//        } else if (status.equals("Gudang")) {
//
//            jLabel10.setVisible(false);
//            jLabel5.setVisible(false);
//            jLabel4.setVisible(false);
//        } else if (status.equals("Direktur")) {
//            tampil();
////            jLabel6.setForeground(new java.awt.Color(204, 0, 0));
//
//        } else {
//            jLabel10.setVisible(false);
//            jLabel5.setVisible(false);
//            jLabel4.setVisible(false);
//        }
//    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        menus = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jPanel2 = new javax.swing.JPanel();
        jLabel4 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel12 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        stock = new javax.swing.JLabel();
        user = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel11 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        menus.setLayout(new javax.swing.BoxLayout(menus, javax.swing.BoxLayout.Y_AXIS));
        jPanel1.add(menus, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 190, 440));

        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/IMG/sidebar.png"))); // NOI18N
        jPanel1.add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, -1));

        jPanel2.setBackground(new java.awt.Color(255, 255, 255));

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 360, Short.MAX_VALUE)
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 30, Short.MAX_VALUE)
        );

        jPanel1.add(jPanel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(230, 10, 360, 30));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("0");
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 340, 20, 30));

        jLabel10.setFont(new java.awt.Font("Lucida Fax", 1, 9)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setText(" PERIZINAN!!!");
        jLabel10.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel10MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel10, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 350, 180, -1));

        jLabel7.setIcon(new javax.swing.ImageIcon(getClass().getResource("/IMG/close.png"))); // NOI18N
        jLabel7.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel7MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel7, new org.netbeans.lib.awtextra.AbsoluteConstraints(880, 20, -1, -1));

        jLabel12.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        jLabel12.setForeground(new java.awt.Color(255, 255, 255));
        jLabel12.setText("0");
        jPanel1.add(jLabel12, new org.netbeans.lib.awtextra.AbsoluteConstraints(300, 417, -1, 20));

        jLabel5.setIcon(new javax.swing.ImageIcon(getClass().getResource("/IMG/email.png"))); // NOI18N
        jLabel5.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel5MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel5, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 410, 60, 60));

        jLabel2.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(12, 31, 70));
        jLabel2.setText("ADMIN");
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(290, 190, 70, 20));

        jLabel9.setFont(new java.awt.Font("Lucida Fax", 1, 9)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText(" PERIZINAN!!!");
        jLabel9.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel9MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel9, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 370, 180, -1));

        stock.setFont(new java.awt.Font("Lucida Fax", 0, 24)); // NOI18N
        stock.setForeground(new java.awt.Color(51, 51, 51));
        stock.setText("stock ");
        jPanel1.add(stock, new org.netbeans.lib.awtextra.AbsoluteConstraints(530, 300, 110, -1));

        user.setFont(new java.awt.Font("Lucida Fax", 0, 24)); // NOI18N
        user.setForeground(new java.awt.Color(51, 51, 51));
        user.setText("user");
        jPanel1.add(user, new org.netbeans.lib.awtextra.AbsoluteConstraints(524, 470, 110, -1));

        jLabel3.setText("Cabang");
        jPanel1.add(jLabel3, new org.netbeans.lib.awtextra.AbsoluteConstraints(800, 490, -1, -1));

        jLabel6.setText("profit");
        jPanel1.add(jLabel6, new org.netbeans.lib.awtextra.AbsoluteConstraints(800, 310, -1, -1));

        jLabel11.setIcon(new javax.swing.ImageIcon(getClass().getResource("/IMG/email.png"))); // NOI18N
        jLabel11.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel11MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel11, new org.netbeans.lib.awtextra.AbsoluteConstraints(260, 340, 60, 60));

        jLabel13.setFont(new java.awt.Font("Lucida Fax", 1, 9)); // NOI18N
        jLabel13.setForeground(new java.awt.Color(255, 255, 255));
        jLabel13.setText(" PERIZINAN!!!");
        jLabel13.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jLabel13MouseClicked(evt);
            }
        });
        jPanel1.add(jLabel13, new org.netbeans.lib.awtextra.AbsoluteConstraints(320, 350, 180, -1));

        jLabel8.setIcon(new javax.swing.ImageIcon(getClass().getResource("/IMG/Dashboard Direktur - Clean - 1025x746.png"))); // NOI18N
        jPanel1.add(jLabel8, new org.netbeans.lib.awtextra.AbsoluteConstraints(210, 0, 830, 610));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void jLabel7MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel7MouseClicked
        // TODO add your handling code here:
        this.dispose();
    }//GEN-LAST:event_jLabel7MouseClicked

    private void jLabel13MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel13MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_jLabel13MouseClicked

    private void jLabel5MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel5MouseClicked
        // TODO add your handling code here:

        String status = SESSION.SessionLevel.getSessionLevel();

        if (status.equals("Admin")) {
            jLabel10.setForeground(new java.awt.Color(204, 0, 0));
            other.FPengelolaanDataGudang mu = new other.FPengelolaanDataGudang();
            mu.setVisible(true);
            dispose();
        } else if (status.equals("Gudang")) {

        } else if (status.equals("Direktur")) {

        } else {

        }
    }//GEN-LAST:event_jLabel5MouseClicked

    private void jLabel9MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel9MouseClicked
        // TODO add your handling code here:
    }//GEN-LAST:event_jLabel9MouseClicked

    private void jLabel10MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel10MouseClicked
        // TODO add your handling code here:
        String status = SESSION.SessionLevel.getSessionLevel();

        if (status.equals("Admin")) {
            jLabel10.setForeground(new java.awt.Color(204, 0, 0));
            other.FPengelolaanDataGudang mu = new other.FPengelolaanDataGudang();
            mu.setVisible(true);
            dispose();
        } else if (status.equals("Gudang")) {

        } else if (status.equals("Direktur")) {

        } else {

        }
    }//GEN-LAST:event_jLabel10MouseClicked

    private void jLabel11MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jLabel11MouseClicked
        // TODO add your handling code here:
        other.FPengelolaanDataGudang mu = new other.FPengelolaanDataGudang();
        mu.setVisible(true);
        dispose();
    }//GEN-LAST:event_jLabel11MouseClicked

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
//        try {
//            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
//                if ("Nimbus".equals(info.getName())) {
//                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
//                    break;
//                }
//            }
//        } catch (ClassNotFoundException ex) {
//            java.util.logging.Logger.getLogger(FMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (InstantiationException ex) {
//            java.util.logging.Logger.getLogger(FMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (IllegalAccessException ex) {
//            java.util.logging.Logger.getLogger(FMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
//            java.util.logging.Logger.getLogger(FMenu.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
//        }
        try {
            FlatLaf.registerCustomDefaultsSource("raven.theme"); // Opsional, jika Anda memiliki file tema kustom
            FlatLaf.setup(new FlatLightLaf()); // Mengatur FlatLaf dengan tema Flat Dark (contoh)
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FMenu().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel menus;
    private javax.swing.JLabel stock;
    private javax.swing.JLabel user;
    // End of variables declaration//GEN-END:variables
 private void execute() {
        ImageIcon iconMaster = new ImageIcon(getClass().getResource("/img/db2.png"));
        ImageIcon iconSub = new ImageIcon(getClass().getResource("/img/db1.png"));

        MenuItem subDataAlat = new MenuItem(null, true, iconSub, "DataAlat", null);

        // Membuat MenuItem "Gudang" dengan ActionListener
        MenuItem subGudang = new MenuItem(null, true, iconSub, "Gudang", null);
        subGudang.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                // Ketika menu "Gudang" diklik, buka form Gudang
                Data.FGudang formGudang = new Data.FGudang();
                formGudang.setVisible(true);
                dispose();
            }
        });

        MenuItem subCabang = new MenuItem(null, true, iconSub, "Cabang", null);

        MenuItem menuMaster = new MenuItem(iconMaster, false, null, "Master", null, subDataAlat, subGudang, subCabang);
        MenuItem menuPenjualan = new MenuItem(iconMaster, false, null, "Penjualan", null);
        MenuItem menuDataUser = new MenuItem(iconMaster, false, null, "DataUser", null);

        addMenu(menuMaster, menuPenjualan, menuDataUser);
    }

    private void addMenu(MenuItem... menu) {
        for (int i = 0; i < menu.length; i++) {
            menus.add(menu[i]);

            ArrayList<MenuItem> subMenu = menu[i].getSubMenu();

            for (MenuItem m : subMenu) {
                addMenu(m);
            }
        }

        menus.revalidate();
    }
}
