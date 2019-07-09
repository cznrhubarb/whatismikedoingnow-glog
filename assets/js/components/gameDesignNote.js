import Phaser from 'phaser'

export default class GameDesignNote extends Phaser.GameObjects.Container {
    constructor(scene, noteData) {
        super(scene, noteData.x, noteData.y);

        this.noteId = noteData.id;

        const cornerSize = 7;
        const footerSize = 35;
        const noteWidth = 240;
        let noteText = scene.add.text(
            cornerSize, cornerSize, 
            noteData.text, 
            { 
                fontFamily: 'Arial', 
                fontSize: 14,
                color: '#000', 
                wordWrap: { width: noteWidth - cornerSize * 2 } 
            }
        );
        const noteHeight = noteText.height + cornerSize * 2;
        let noteFooter = scene.add.nineslice(
            0, noteHeight - cornerSize,
            noteWidth, footerSize,
            'panel',
            cornerSize
        );
        let noteBody = scene.add.nineslice(
            0, 0,
            noteWidth, noteHeight,
            'panel',
            cornerSize
        );
        noteFooter.setGlobalTint(noteData.color);

        this.add(noteFooter);
        this.add(noteBody);
        this.add(noteText);

        this.setSize(noteWidth, noteHeight + footerSize - cornerSize);
        this.setInteractive();
        this.input.hitArea.x += this.width/2;
        this.input.hitArea.y += this.height/2;
        scene.input.setDraggable(this);

        scene.add.existing(this);
    }
}