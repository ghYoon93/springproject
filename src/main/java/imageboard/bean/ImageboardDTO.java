package imageboard.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ImageboardDTO {
    private int seq;
    private String imageId;
    private String imageName;
    private int imagePrice;
    private int imageQty;
    private String imageContent;
    private String image1;
    private String image2;
    private String logtime;
}
