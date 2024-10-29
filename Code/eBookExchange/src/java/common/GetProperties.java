/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.util.Properties;

/**
 *
 * @author CDAC-49
 */
public class GetProperties {

    Properties prop = new Properties();

    public String showMediaFolderLocation() {
        try {
            this.prop.load(getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return this.prop.getProperty("ims.showMediaFolderLocation");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String saveMediaFolderLocation() {
        try {
            this.prop.load(getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return this.prop.getProperty("ims.saveMediaFolderLocation");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String findAttachmentPath() {
        try {
            prop.load(this.getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return prop.getProperty("ims.attached_file_path");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public String findReportPath() {
        try {
            prop.load(this.getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return prop.getProperty("ims.reportpath");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public String findCardPhotoPath() {
        try {
            this.prop.load(getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return this.prop.getProperty("ims.cardphotopath");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


    public String showWikiMediaFolderLocation() {
        try {
            this.prop.load(getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return this.prop.getProperty("ims.showWikiMediaFolderLocation");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String saveWikiMediaFolderLocation() {
        try {
            this.prop.load(getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return this.prop.getProperty("ims.saveWikiMediaFolderLocation");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String findATCellFolderLocation() {
        try {
            this.prop.load(getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return this.prop.getProperty("ims.saveATCellFolderLocation");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public String findDBBackupPath() {
        try {
            prop.load(this.getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return prop.getProperty("ims.databackup");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public String findWikiProfileDownloadPath() {
        try {
            prop.load(this.getClass().getClassLoader().getResourceAsStream("ims_filepath.properties"));
            return prop.getProperty("ims.wikiprofiledownloadpath");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}
