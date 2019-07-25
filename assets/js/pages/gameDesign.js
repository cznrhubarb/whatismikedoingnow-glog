import * as React from 'react'
import gql from 'graphql-tag'
import ApolloClient from 'apollo-boost'
import PhaserElement from '../components/phaserElement'
import { Plugin as NineSlicePlugin } from 'phaser3-nineslice'
import GameDesignNote from '../components/gameDesignNote'
import { Plugin as BitmapLinePlugin } from 'phaser3-bitmapline'

const NOTE_QUERY = gql`
    {
        gameDesignNotes {
            id
            color
            text
            x
            y
            leftLinks {
                id
                text
                rightNote {
                    id
                }
            }
            user {
                name
            }
        }
    }
`;

class GameDesign extends React.Component {
    constructor() {
        super();
        
        let self = this;
        this.state = {
            gameCreated: false,
            notesData: null,
            gameConfig: {
                type: Phaser.AUTO,
                width: 800,
                height: 600,
                plugins: {
                    global: [NineSlicePlugin.DefaultCfg, BitmapLinePlugin.DefaultCfg]
                },
                physics: {
                    default: 'arcade',
                    arcade: {
                        gravity: { y: 200 }
                    }
                },
                scene: {
                    preload: function() {
                        self.sceneRef = this;
                        //this.load.setBaseURL('http://localhost:4000/');
                
                        this.load.image('panel', '../images/large-panel.png');
                        this.load.image('twine', '../images/twine.png');
                    },
                    create: function() {
                        this.cameras.main.backgroundColor.setTo(100,149,237);

                        self.setState({gameCreated: true}, () => self.displayNotes());

                        this.input.on('drag', (_p, gameObject, x, y) => {
                            gameObject.x = x;
                            gameObject.y = y;
                        });

                        let line = this.add.bitmapLine(new Phaser.Geom.Point(25, 25), new Phaser.Geom.Point(500, 25), 'twine');
                        //setInterval(() => line.end = new Phaser.Geom.Point(500, line.end.y + 1), 10);
                    }
                }
            }
        };

        this.gqlClient = new ApolloClient({ uri: '/api/graphiql' });
        this.gqlClient.query({ query: NOTE_QUERY })
            .then(data => 
                this.setState({notesData: data.data.gameDesignNotes}, () =>
                    this.displayNotes())
            )
            .catch(error => console.error(error));
    }

    displayNotes() {
        const { notesData, gameCreated } = this.state;

        if (notesData && gameCreated) {
            notesData.forEach(note => new GameDesignNote(this.sceneRef, note));
        }
    }

    render() {
        return (
            <PhaserElement config={this.state.gameConfig} />
        );
    }
}

export default GameDesign;