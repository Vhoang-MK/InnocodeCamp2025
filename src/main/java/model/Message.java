package model;

public class Message {
    private String role;
    private String text;
    private String base64Image;

    public Message() {
    }

    public Message(String role) {
        this.role = role;
    }

    public Message(String role, String text) {
        this.role = role;
        this.text = text;
    }

    public Message(String role, String text, String base64Image) {
        this.role = role;
        this.text = text;
        this.base64Image = base64Image;
    }

    public String getRole() {
        return role;
    }

    public String getText() {
        return text;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    public void addText(String text) {
        if (this.text == null) {
            this.text = text;
        } else {
            this.text += " " + text;
        }
    }

    public void addImage(String base64Image) {
        this.base64Image = base64Image;
    }

    public boolean hasImage() {
        return base64Image != null && !base64Image.trim().isEmpty();
    }

    public boolean hasText() {
        return text != null && !text.trim().isEmpty();
    }

    public String getMemoryContent() {
        String result = "";
        if (hasText()) {
            result = text.trim();
        }
        if (hasImage()) {
            result += result.isEmpty() ? "[Image attached]" : " [Image attached]";
        }
        return result;
    }

    public boolean isEmpty() {
        return !hasText() && !hasImage();
    }

    @Override
    public String toString() {
        return role + ": " + (text != null ? text : "") + (hasImage() ? " [image]" : "");
    }
}
