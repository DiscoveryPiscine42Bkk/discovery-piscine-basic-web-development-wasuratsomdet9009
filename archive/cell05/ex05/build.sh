if [ "$#" -eq 0 ]; then
    echo "No arguments supplied"
    exit 1 # ออกจากการทำงานพร้อมรหัสข้อผิดพลาด 1
fi

# วนลูปผ่านอาร์กิวเมนต์ทั้งหมดที่ได้รับ
for arg in "$@"; do
    # สร้างชื่อโฟลเดอร์ใหม่โดยเพิ่ม 'ex' ที่นำหน้า
    folder_name="ex${arg}"

    # ตรวจสอบว่าโฟลเดอร์นั้นมีอยู่แล้วหรือไม่ เพื่อหลีกเลี่ยงข้อผิดพลาด
    if [ -d "$folder_name" ]; then
        echo "โฟลเดอร์ '$folder_name' มีอยู่แล้ว ข้ามการสร้าง"
    else
        # สร้างโฟลเดอร์
        mkdir "$folder_name"
        # ตรวจสอบว่าการสร้างโฟลเดอร์สำเร็จหรือไม่
        if [ $? -eq 0 ]; then
            echo "สร้างโฟลเดอร์ '$folder_name' สำเร็จ"
        else
            echo "เกิดข้อผิดพลาดในการสร้างโฟลเดอร์ '$folder_name'"
        fi
    fi
done

exit 0 # ออกจากการทำงานพร้อมรหัสสำเร็จ 0
