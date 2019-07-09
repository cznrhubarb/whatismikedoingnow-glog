import * as React from 'react'
import Phaser from 'phaser'

class PhaserElement extends React.Component {
    componentDidMount() {
        const config = Object.assign({}, this.props.config, { parent: this.refs.phaserContainer });

        this.game = new Phaser.Game(config);
    }

    shouldComponentUpdate() {
        // All the updating is done inside the Phaser Game
        return false;
    }

    componentDidUnload() {
        if (this.game) {
            this.game.destroy();
        }
    }

    render() {
        return (
            <div ref="phaserContainer"></div>
        );
    }
}

export default PhaserElement;