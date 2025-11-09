// ignore_for_file: public_member_api_docs, sort_constructors_first

class Reels {
  Reels({required this.id, required this.url});
  final String id;
  final String url;
}

final kTestReels = [
  Reels(
    id: 'reels1',
    url:
        'https://media.istockphoto.com/id/1471669024/video/police-detective-reading-evidence-document-looking-for-suspect-in-criminal-case.mp4?s=mp4-640x640-is&k=20&c=XsOR6fzWgiG_OKgnOitc59IydkNGof1234XLlU8dSkU=',
  ),
  Reels(
    id: 'reels2',
    url: 'https://cdn.pixabay.com/video/2015/11/27/1406-147169807_medium.mp4',
  ),
  Reels(
    id: 'reels3',
    url: 'https://cdn.pixabay.com/video/2016/02/13/2141-155244186_tiny.mp4',
  ),
];
